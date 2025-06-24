Return-Path: <linux-renesas-soc+bounces-18639-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C1EAE5D47
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 08:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32F4E16AFEF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 06:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5671E22422F;
	Tue, 24 Jun 2025 06:58:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFE442065;
	Tue, 24 Jun 2025 06:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750748303; cv=none; b=DtW9LPLJvgzitLSHAod4G5yxNovhrZLROAw7ReFWMtK3lDaHWSTDCXTAQfAqdaut+KdvuqabPr2vjpttxZWUSp9tO4SUBlhGZIrx4XH2arbslII2JpUZLN1VE86QJd0V1iJl/Ake6UU93oeuNDoj1oZ1DP+h63R4QOxev0sQD4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750748303; c=relaxed/simple;
	bh=ll+XCQtbnZpyxXV1CX8tUsesHOegPhxgo220bAItwDM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BEcI+JjosByu5RSr1BDFVWzAm4HizkL14DfucNc5Khouoey4TyATETrOXLIa5besHATnWUSZQ0i4FACebl8Iep0Xe5Mgwt0DHiYihkh2ldL6yrE79hIZtcPUggwrY9i4h7EyvGlD1NxsZ+lLFA5qwN7OoViVz9mBmuOqL50KYbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5315acf37b6so1573532e0c.2;
        Mon, 23 Jun 2025 23:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750748300; x=1751353100;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I3mb0VhzXDswklcC+tGvNju9dri/YZ4kpTTjwEnQ8oA=;
        b=F9tuvUTuU6ogyoRSgfNhy32ZWzIN8FcN5FvXPRyNVDB1qoK3RVqu99FNXWa16mcTmb
         +9H545r1Wo2EH9RjmCGtqdf9xPjzal4a+ZRKVtaFhv1TlER6JEw1OsX0o80cjA6kf81f
         8cckH2dKpLtK5/Ph5SjIDZ9MqVAMPYrncHnUjjm0skq0NqWOyBfCf13fD10mofzcg8cg
         afURmygH2PPIWOiel4PBvyaDuPU2R3v2ImL4ZXa3NI0E7WnvjPclTcZ6mZ1WcBWqzs4x
         lQXNnSrz0JKwVLb1uu0KE/F4FEdO3dOsauLAWyOdqM7iR/LpScxBPUE5c8MgIKPbEfoE
         DmSA==
X-Forwarded-Encrypted: i=1; AJvYcCU25SWZJ5LKnbFYOs/WI7n61KrUOusKH//c1nj8Q/wQXCyQ1Tes5Mn09P82f/lDtpj99L1eW86h7GNoscdo@vger.kernel.org, AJvYcCVGJ0uJl3w8jhjzuSP1IIup/7aqxKOTwCXeKnNaejNxpZDsgEz9l6O2ACwXKynKlbrTbLtliHDgTQNne2+LhnTnefI=@vger.kernel.org, AJvYcCVSPsdMOhYrLdzKbUz/KoJCPsVwqOBLW9Rb5ADcuFOgJGLxjGeImkY96ogSJzZHaL3E9WwlojZz01s=@vger.kernel.org
X-Gm-Message-State: AOJu0YycFtwB6ERbGmjzOdWIEvhHJwLXaWLkWFm/3enyZImGhNNGaDS7
	2/GBto+pRn4Et/RQes7GGo9WsunjdbyHqw0E5qgKx5HRyT/5wLb9et4hhS5goLGN
X-Gm-Gg: ASbGncu7YM40J0k3xWbhl8Rim9axK0xnGe402MA6yPggNGIx/yL7AZNvnUgan7arVXb
	gNsPuAY7cyatutpOsMnH+j0PyLb0INrnM1KbpPlUHo4KwdrJg88lCW2MHeuJcfHBkm+BaOgnw5t
	Dfv6wbpPOGxM7vLwx+O6bpVPLuNevjS0y/rIJkpBwgjJJ9CXPTHXaJFUN8luBy8u2q6+2dh5p6z
	tx5FI311fJaX9GXWLZgVrSM3cUur6of6XIdi3yjBEEbQSWZbxI/CAUUQgjpHBHhECfcYtt4BsSG
	ZOIL390iww91BRxZEFqkj+SzG7hNTWAszeTpDkpUsjfCI8/TJ/Fk0cIZHp2LISJPROFXAbX3dHA
	c/eokbPuQjSoYoRb/B43hMOiU
X-Google-Smtp-Source: AGHT+IH13kO9YbN/OP792OHwLxVq9xJLt1+adMRr3ztnrXD9QfANaSlEjjo0oCqpeabfB0hX/HhAEg==
X-Received: by 2002:a05:6122:4fa7:b0:530:66e6:e214 with SMTP id 71dfb90a1353d-531ad5211d8mr9933143e0c.3.1750748300282;
        Mon, 23 Jun 2025 23:58:20 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-531ab202cb0sm1567358e0c.9.2025.06.23.23.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 23:58:19 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86f9c719d63so1133277241.1;
        Mon, 23 Jun 2025 23:58:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOFu9gsnoDagXiYFGRaYljZMSqd2EAD558d0UcOO2+BCL0zBwoaxJy0PVAqi3Ulnj1/ON3G7lUXAWOo9k98qgpLVA=@vger.kernel.org, AJvYcCVJuPaf1TkBEuaWWCy6svMxXKDdncoxa//WFtdx10GSfTaDnkpSxrnoD0yzmz0YFJm+Vxm5FU5yc65tFsVI@vger.kernel.org, AJvYcCXWeSFJmd4eMxPgbDX180qWJT+iMRwGpHG70s/K9plcp3GwSlY21jFy5VcNaoiLUMPkmmoTGXLDsdE=@vger.kernel.org
X-Received: by 2002:a05:6102:2d01:b0:4e9:b076:9f7f with SMTP id
 ada2fe7eead31-4e9c2cf29b5mr8486894137.16.1750748294782; Mon, 23 Jun 2025
 23:58:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610072809.1808464-1-raag.jadav@intel.com> <aFVO-QtE3D3dU7y8@black.fi.intel.com>
In-Reply-To: <aFVO-QtE3D3dU7y8@black.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Jun 2025 08:58:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVPDxgEV49yN1JS8Q2WVwxfau6kccMV0OPojxDnMfp-yQ@mail.gmail.com>
X-Gm-Features: Ac12FXyVxQAMbNcfIs45xL1NaEpK__-Ph2zKIrzrkRShDUqHQRPel2D8ZJHFv1I
Message-ID: <CAMuHMdVPDxgEV49yN1JS8Q2WVwxfau6kccMV0OPojxDnMfp-yQ@mail.gmail.com>
Subject: Re: [PATCH v1] clk: renesas: rzv2h: use devm_kmemdup_array()
To: Raag Jadav <raag.jadav@intel.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, 
	andriy.shevchenko@linux.intel.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Raag,

On Fri, 20 Jun 2025 at 14:07, Raag Jadav <raag.jadav@intel.com> wrote:
> On Tue, Jun 10, 2025 at 12:58:09PM +0530, Raag Jadav wrote:
> > Convert to use devm_kmemdup_array() which is more robust.
> >
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>

Thanks for your patch!

> Bump. Anything I can do to move this forward?

Please include linux-renesas-soc@vger.kernel.org next time.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

