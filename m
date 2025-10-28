Return-Path: <linux-renesas-soc+bounces-23721-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9742CC13ABC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 10:02:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 590F44EE7CD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 08:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1763F2D7387;
	Tue, 28 Oct 2025 08:57:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFA22D6608
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 08:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761641849; cv=none; b=YBe68RQ+hLZNjh9fQxFB0afABnBntLryBqX3mLZ2mZ1FEaU83qirRjJ14f/4mMTqI9xPuVhh8I+M2JWIqxiDC77VEizkkGdvSR5arUunpELh3MiksyGhPNSYKXt6lb6U+ivPfy2TFXUirCPf4L10MZ5DcMeND9hIGjUh7PlzxdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761641849; c=relaxed/simple;
	bh=HeX4/+QdTeIkEsusdgtpVEWN5CZYZZgYZNEcjz+3FZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qr2c9DTKkBsWo0AtNhySHncJvoZRZbkiUxFLe8K1pGLBv08nFS1dTIPDElRiNrTm862JEP1jBkBETBFNuQsPkF3j368ipNMWctmGKLE3iyn4B4RCUwRhdMgKyQD4UYJjxqJlpPeLqeELCze/fZLUSYFlxLSMi1quXQX4PX3x9cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b6d70df0851so836145066b.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 01:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761641840; x=1762246640;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I3bhh0DQ8aw3qyEM+t66V7wEI7qFPP5kxL/D0neXiao=;
        b=EHa0+l1nFOkTGRz3Q7p4z0/+J36TOW7m+4jmA4IjtxhIDzm9iO3bV8La7lFNKRPg91
         ZTsJ6c80XggkT4Scs39MFInyEfIgp3SmJkqa4ZlTvJbbb9DkMLdPXLiF+F73uUVpUBSi
         +bv/FXWSxSxTxnPpdmAmlIbD5SqD4AfuiChaENx6WR1iNqxonB8mNquFJ8OaVl4cNXfb
         WdNuTtfGZSJOLwaShrPhUamwi8t2UsKma7ugxpfjOu/e/5DAhF7sicUGKNFZLrG/6S32
         h7roI0ACbsiYTSPgqKpeJlGOM8yi5uWCENNE0YXjEuHU92FJfQQ1etAHlDea+bomTX+C
         bvUg==
X-Forwarded-Encrypted: i=1; AJvYcCVHMBWDUXNhQfh3fWu1hmj+Fy0RRRnJpG7phaQeu+nDYY47PnaFWYnY8MAFyP+9ja5oG2FxBzObLUA5dz1TlzYw1A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq300TxBF+Sj/ulzlZ30sOIq2VwbmwbEkePYaopB+ToECNW7jM
	5b7PP3cDq1aGF8YWScGI/IkLJT0Ak+4Cxbn4TUY/1lI/fXRM2bRjSGWFOuQBaeqz4Oo=
X-Gm-Gg: ASbGncs0uEccKszsLhus4peKRe/f3Y48+EQ0AGKNAYh0RE3VFtkr1L9eD8to8W2UN55
	tlbL0vitj0HRN+ew8bSpuQaIA4W0TQco4PkpxGWjYXptxtnjNjpKCJ7xC0PfLst4JlZfuXgK9d1
	4URUlrTqPQudqHwmGjolZ7lvGaOLjQsk3uHl0Uu0ADD53a5ZuTAjtG49rGTo9F0toLZww/dnnzb
	vS+TBDpeuBp/3cUR+PBTHjjskUo0nXskzI/RIqEZ7qV2mXPhm43NsHjTxPIJ9mtRCykmJN3vYdl
	qB4aUrBHxlskRC5Y1sc0ViMaBGYsnvP69RIPFUTHxI2jEFyx2VDUz/ama+soB+KhXUlih05P7h3
	i2ES1sfWNL8RaXF9PGvkzcLUVhSFozhvIXtgj/FGynAMTAAlTdL6yeq5tZV1JOSC3Iyaz/kGbIN
	kFgSTqxBScm3uaVS3pCSYOzMx3nshFEUsjgquTGw==
X-Google-Smtp-Source: AGHT+IENTqqqRxOWNBnbGeU8pSC9rdN/H7ohsS4wd3KKwaXGViG6gwCurZoSUpv0+GiFzL+DUbD4pQ==
X-Received: by 2002:a17:907:7255:b0:b2d:a873:38d with SMTP id a640c23a62f3a-b6dba58bf7cmr321757966b.43.1761641840028;
        Tue, 28 Oct 2025 01:57:20 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d85369697sm1064906566b.26.2025.10.28.01.57.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 01:57:16 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-63e0cec110eso9691142a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 01:57:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXNDQVaDVFnPPLagh73Ms+svvVCkONT0ffckkgoxdgO74lAux0u13EBUVYVFG6MpfsADrVsScQ5wnOC3qKU+cRaVg==@vger.kernel.org
X-Received: by 2002:a05:6402:350c:b0:639:ff4f:4bba with SMTP id
 4fb4d7f45d1cf-63ed7e0c0c0mr2377923a12.2.1761641835996; Tue, 28 Oct 2025
 01:57:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com>
In-Reply-To: <20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 28 Oct 2025 09:56:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVyeyiHWnBRw9gOF6=_m1SHa313dF20yKA83oQMS_oSFg@mail.gmail.com>
X-Gm-Features: AWmQ_bnk1oZlJu05NjQHeWpy9S3BuAl1j3bdf7YMwemWUQbyo0ARvnVUlNuRCto
Message-ID: <CAMuHMdVyeyiHWnBRw9gOF6=_m1SHa313dF20yKA83oQMS_oSFg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm/display: bridge_connector: get/put the stored
 bridges: fix NULL pointer regression
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Luca,

On Fri, 17 Oct 2025 at 18:58, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> A patch of mine recently merged in drm-misc-next [1] has a NULL pointer
> deref regression (reported here [2] and here [3]). Being in lack of a quick
> fix, I sent a revert proposal [4].
>
> The revert proposal has no answers currenty, and in the meanwhile I have a
> patch that implements the original idea but without the same bug. So here's
> a v2 series with:
>
>  - the same revert patch
>  - the original patch but rewritten without the same bug (and even simpler)
>
> Also the re-written patch is now split in two for clarity because it was
> doing two somewhat different things.
>
> [1] https://lore.kernel.org/all/20250926-drm-bridge-alloc-getput-bridge-connector-v2-1-138b4bb70576@bootlin.com/
> [2] https://lore.kernel.org/lkml/336fbfdd-c424-490e-b5d1-8ee84043dc80@samsung.com/
> [3] https://lore.kernel.org/lkml/CA+G9fYuKHp3QgPKjgFY3TfkDdh5Vf=Ae5pCW+eU41Bu=D7th2g@mail.gmail.com/
> [4] https://lore.kernel.org/lkml/20251016-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v1-1-81d6984c5361@bootlin.com/
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> Changes in v2:
> - No changes to the revert patch
> - Added the (corrected) patch introducing the same feature as the original
>   buggy patch, and also split it in two fir clarity
> - Link to v1: https://lore.kernel.org/r/20251016-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v1-1-81d6984c5361@bootlin.com

Thanks, this fixes the crash I experienced on Koelsch (R-Car M2-W)
(https://lore.kernel.org/CAMuHMdW=zEi4XjG2Qrvj=jCa9LPBRU7HBTwEQVbe0zoz5mV_XA@mail.gmail.com)

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

