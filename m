Return-Path: <linux-renesas-soc+bounces-22447-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DC3BA94B4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 15:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E67981743AF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Sep 2025 13:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009F9304BB9;
	Mon, 29 Sep 2025 13:14:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9A6305045
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 13:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759151689; cv=none; b=r07otBLlQmnuFD6bi9f4oQSRCUv0GYQ4lZuESBDIaniJn6UdyjgL1UKjaSzuZhfxzvltqSllJoBsk3Q0xtmbRI0ldnti2KAsdewh34Ovf8/l8DWvZXJ/JqyOQKomU6f87VGhKnJZ7mfwbLz+TWhv/cCSCaQXGlpyTckZu+p36Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759151689; c=relaxed/simple;
	bh=/CeoiIO4oEpN9VjHP8HfKiYF99Pkq0Nca8WusPYehew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZEQoCgAJCLjBbEz/v8HAqbFwqnAcetSLXM79Pgnah+l7G3hCIYAY8zo71wBvnXkiplpLA7T1fvf8mUllsSNHmcTRlJiH9Z39BinMRfzZUlxgHW4lDQmzhPtfamYdFGucsLWVYhYJrhQUEODScjntH/MrOTarsKtSBvOUQdbQmDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-89018e9f902so2433532241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151686; x=1759756486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WGWKfU0acW/iaFNqPdL/2iourou2d7uCdc802/WdX5U=;
        b=XunhV+co8TjbkTViqI02TewKpm3KF5hbdwRE+oROF2/+fOtF07e4yqLssmIxxIYnv0
         A5oIoiZvmZmmnwt+vacvkpYI+ndWVR5J8MyV+ttrcmj020uyLXDU/Vfj/u5R9O3OSiRY
         ENWephStHb8b7Q6L28GF0gwTpHcZ8ybpVdkcNPr+aQEvPZsO8uWi0Nk7omdq2h7FCwia
         kHKdgabJHB6JSP82vd+tyqIoM1G26XaMqI0LKLOBx8ejNWBJmV603Uuh19Ogw5VGMecl
         wfcBSTisQ4EYpDbk9Uc+vz5MKkCiuhidraROJHAQiFVWrICcZx0xFXGuDJXoiI3SfjL/
         pWGA==
X-Gm-Message-State: AOJu0Yx6lgolk79O5c8PVEX0fFX8/czfTxTzt2ecCF7/wgabsBfoWS/i
	R6iN1PX3jhrLVwQlLokfZaJfTUZowzWHk1tqbCGsbRJFa+zBjG1IKgiLYUZ53+GC
X-Gm-Gg: ASbGncsXRQtPJDGbvThgHGzL9/3qdYjaGiEMqqsWMtDWUDwLLvDsUaChg8Tx8D1qaXb
	qVq/8Ev3mK01zKESzEF4FdTd8iu12T0dI5TyUAJeGP8s3TPPpTNGARpcv89rofSdXAJfS6yQhHM
	AcF1ZjtEatv8dMt/5Lye1ib9MVOAing/2+mUFU8m8BzMY6ptROv/tV7FGXly5QzVJieB9TyFjF9
	FJZE79y1IXefm1djTuIyFGwL/wVqblbgmRb+cdRINWwPAV+Wc1QIHvGFkF+nFhb131VBaggQP2h
	kH6MreTmYPM18Lk28gWtBEthmGA+ceXrTt53cL7oO41Eo7l+1ykK+SZkETUPXaPJ3tnj6+qF/Xb
	u7oP+3Pc6ODklzS2vlmBybV2Kl6TUBG7d+3FTiM+19+d4Cvq7LB3X0lZ8+KDh
X-Google-Smtp-Source: AGHT+IGKfJRreZ9aPfMaEQIbp1KSr0/iG3Y0KxUbyU3qe3RtQuUkNInJdmJqQ4ZVEr/KyjLxnOQ3Ww==
X-Received: by 2002:a05:6102:c8b:b0:5a1:3bcf:a93f with SMTP id ada2fe7eead31-5c887d26ac2mr1437628137.4.1759151686524;
        Mon, 29 Sep 2025 06:14:46 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ae39efda42sm3332739137.13.2025.09.29.06.14.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 06:14:45 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-556f7e21432so3557335137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Sep 2025 06:14:45 -0700 (PDT)
X-Received: by 2002:a05:6102:38c9:b0:5ba:4f5c:874e with SMTP id
 ada2fe7eead31-5c88b982189mr1331189137.31.1759151685651; Mon, 29 Sep 2025
 06:14:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250925093941.8800-14-wsa+renesas@sang-engineering.com> <20250925093941.8800-15-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250925093941.8800-15-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Sep 2025 15:14:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVcrHxygr--KQ5m7YkjX6GB+ZfHKTbyboP+B7+pLnaHpw@mail.gmail.com>
X-Gm-Features: AS18NWDrjmLfzPnBy9AB61YOjKBbiuhqpt7e_ezYaZbcZ7esItPUKbOiel4459c
Message-ID: <CAMuHMdVcrHxygr--KQ5m7YkjX6GB+ZfHKTbyboP+B7+pLnaHpw@mail.gmail.com>
Subject: Re: [PATCH 01/12] arm64: dts: renesas: r8a77951: add SWDT node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 11:40, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
on the RFC is still valid, will queue in renesas-devel for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

