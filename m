Return-Path: <linux-renesas-soc+bounces-13049-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7768AA30CC5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 14:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 954287A1013
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 13:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE03420B81B;
	Tue, 11 Feb 2025 13:24:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB82320F
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Feb 2025 13:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739280282; cv=none; b=efWBvWIsLI1u/EPXlR91GScqJYtHOpmOuVH1zEUtY1eMnkx8KgRF8al/MynRoJNfYGuH1jehu0w87z4ROZifYhnQPXXt0uzIIzvay00FiVV9KYmp/LqUdxWm1mpBQi/zEtaMmOIz+uZEdOcHo9gYnS9ccXkqrHaWI8/lGZhsCAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739280282; c=relaxed/simple;
	bh=iANBQH10emiKouje56OoKfqv0KAaiNtqFDLnac+IREA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p1LKYu8AmFzP9FoHr938l2Ll6VLhj9OBGX6Ei0VqV18PF0ch0Ju+b8Lc/ZiF2vMWGeQZ8tQTFOHnTJtqX0fGUqWnshj8u2+3e20rPPpAjE9hR+/KDEBobBHUpSMKg9NMg7L0Ij04NPQTaVdlzPaCYcCXWz9CpHHrH5bdNk5R37I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-51eb1a6ca1bso1491368e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Feb 2025 05:24:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739280279; x=1739885079;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FsVOCfj+wjXa5Rxath61ZNo8HOAUbOhvSGTrRcYWuzE=;
        b=Qvvc/PzTTqDpBfZkcnmUpLJ63fffNoDXmJIune/TJ/xLE7woIsxkStg5vznLpZGOMI
         Cynih1DixYwP/3Ac/tvTtcXDDBSgbpJ2dXduD0ZXB6EpMJwcWq/MzQvOGwAyMI+fL8P4
         z0sWabkRubJMvc+s6gjA3NgReeo+m9F6OMD770pRPinjXzZXoYnRaqoMC/rRkY7vJfHc
         y2voCpteUjVBNXCoIAbZd/MCGHnlivmxtOAqYQW48QQWSLzTH/L/DbNLtQpv7Fs62blJ
         Apsd0SRiaDPLNDXxZKMzCF3sf+hp+gJfwgiROM6WDMwyn9k3sm8WS+bF8UlOL9bl/1sQ
         gNCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbk3z1eA70ujAgfcgiQ7dvRpFHo3EMfAoyzGah7xve8P7DSaPgzL/zlWa3/9KoOW3Buub1ehHknlrCImJ6f5Z7fQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyZz/opaihAdRHpx7P55MQXWNKtPuaxJA2EBR3FcDZoSYjAQVfY
	aBgl3NwRJ6CQWY5+J+gqDH/rczMFQ0C+0dPfw5uxFLWNA3u28XTFP8itQlkJSXU=
X-Gm-Gg: ASbGncsIVaQUgn+dzCkU+5VuRFeVfYdeASBRHMjKN2I3y5y9bkNV++QYx1hVtX8fBUj
	wBR7mo1SO/BAj9GBWkCT6eiwbmAQgolv+/AL1LT5IyAN/D3Z9eS7dJcFKwRAGOJBY6qoooCkIC1
	7/hnN06Wd5WgZfbk2ODScCmOU45XsiXy3CkIa6GLyED9a4Xu1YlPtxMgcEqVuF4yGDPUtM0FnMK
	6ZJY4XQaeLylL1ZGpghoYZ4+O3LuLdbDL1jCPbYZEySgZt3BBVLIiY6lg3NNzZeqoBZCOcD0eC+
	FfmuefkWNtL9LZNA8PFk207FtfW1NiYVGxMVS08B9dY6OQTTPFI05KaW5w==
X-Google-Smtp-Source: AGHT+IFwgPNucDRtyuWM09VaEXVIz2a7gQpJfQ62tHjsuRAEC2SGwbZ9XD284ropzqYYUloks0VFTw==
X-Received: by 2002:a05:6122:a14:b0:520:42d3:91aa with SMTP id 71dfb90a1353d-52042d39406mr4801475e0c.2.1739280279097;
        Tue, 11 Feb 2025 05:24:39 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51f42734a5dsm1006392e0c.17.2025.02.11.05.24.38
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 05:24:38 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-520525dcd8fso459122e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Feb 2025 05:24:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXcr5ENu+UDt25OSkxV+hNC2J7RDxg6Icl+Sq7tFVbjRGaI4oVfS7/SpCuIyBD2R4MFbsTEj1LD2SwUTOz60p9PWA==@vger.kernel.org
X-Received: by 2002:a05:6122:2528:b0:518:9f81:f91d with SMTP id
 71dfb90a1353d-51f2e2a6b2emr11214846e0c.10.1739280278358; Tue, 11 Feb 2025
 05:24:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207113653.21641-1-biju.das.jz@bp.renesas.com> <20250207113653.21641-11-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250207113653.21641-11-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2025 14:24:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWw4rfSDr58jPs2SuNb8P33qw94riHhLVkJhsCW6sEV8g@mail.gmail.com>
X-Gm-Features: AWEUYZnjMDU_rK8ediMFvjB9CogZmUHJyv5XgtIVgWuAEr_Jrk6_laqeBt6kDvs
Message-ID: <CAMuHMdWw4rfSDr58jPs2SuNb8P33qw94riHhLVkJhsCW6sEV8g@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] irqchip/renesas-rzv2h: Drop macros ICU_TSSR_TSSEL_{MASK,PREP}
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 12:37, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> On RZ/G3E, TSSEL register field is 8 bits wide compared to 7 on RZ/V2H.
> Also bits 8..14 is reserved on RZ/G3E and any writes on these reserved
> bits is ignored. Use the bitmask GENMASK(field_width - 2, 0) on both SoCs
> for extracting TSSEL and we can drop the macros ICU_TSSR_TSSEL_PREP and
> ICU_TSSR_TSSEL_MASK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

For the logical change:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

