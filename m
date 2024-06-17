Return-Path: <linux-renesas-soc+bounces-6331-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B9590AACE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 12:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9321AB2860E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 09:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734A8192B7E;
	Mon, 17 Jun 2024 09:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vMshC/X9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90049190480
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 09:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718616686; cv=none; b=Ew8EVe50vRjQTe93oe4KcYg8ePcryoqcoeauWjV9GeloLLzGO0q+LWg57A8nY5op35vLykzFGAS+zsLHBSuXpuIVflWVAJuCpOYwEaWgTtfHg5xV4VuNFBtdGcvkdJx/6d6PjW8xE6rQN63ekRJxV2BHosDjWeOERck8FMh/ImI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718616686; c=relaxed/simple;
	bh=ZdedvZWlo1R/wrky6M8ITuvK2Y78RSb9b/mj86Q2LXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cJzFIWD9mJyfMJ+ZdKjaAJis3m2mAMOTeqTVp4uLZRWlYjhgt9B1fuVWV8VXqCYMapif8obULPtDSAx8BfdScCUYPMYfjwj4RzeCFhF5dEO5THT8wLt9eWRXU8Lwu8du40+Z1fS/VbS58hwv31i+rykLjF8ktfcKqHT88Drq6B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vMshC/X9; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52bc121fb1eso4963225e87.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 02:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718616683; x=1719221483; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GAguOle9srt7pvchQZTzWqXM3OKcSwyupTpNJxWPs+s=;
        b=vMshC/X970Zfaeo3UAswskBRybWFSB2jNN2V97iR/Sg1G14w3dT2JN10sqIxpLo4tB
         vPtxpjoySVasKsRK/T1kr0yrn4DjOkDPqV5xov8sUqwa6M4EzSGKaY7FTpDy+lI5Fi9W
         QZeyFj9LyZme8sUnPZzhmgyKy6nf/xNuPAO/sr+iz5V89a0WkKqSl15TxguL+77r0iZ9
         Lt8izF/Wiw/ScNU9x8qjrJAZOYa36hm0G6tcgQTZ5w7sdVoZ+QODnAbP/7WfGH0I9fxw
         2IXEE1bemOBuAummmhvv8PpImGgBo0GVyWi7P5XsgD7uJXWegub/+7tq9p+NgH+3F/DN
         C14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718616683; x=1719221483;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GAguOle9srt7pvchQZTzWqXM3OKcSwyupTpNJxWPs+s=;
        b=EF2eyH56GBAbKlsXqr7kE8tYlY8IZN71qhSwRkv6Mbr51f5dlv7rR/YtmW3nFfiCDa
         iTCATy5JaoDGgBsUQyO3ydmbF4Mxpyf24WRY88T0B9gFo7u+DXgoB45elXQArArRL8Ni
         k2aySV4f3IQxAgWgysL+/BYnyrj1NmXDk5E3iUzCwCQjFOe7PT9eDjjRedw7rgTksPIj
         QTDfrmApI0KyWpipjUPRGbLXlmAcMFme+LsbMy/R6ONiiNIoOISEPtP4E4Nz6VDfJbUZ
         DVQjtoQzr1JCgDyP8pOeolIPMczkLsp4ixSoxzod1fylnzAe2V668iSnbTaCONTphVM7
         qv0Q==
X-Gm-Message-State: AOJu0YwJgkVHD74ITtYJ6VBEeTsCgQokg2XI4IbbHMmUAn48fIy8peNK
	fhckF7c4B8cOkZ0Jgaa1CbAqXeJacdmga+onlfrsKLkHFqRxtCXb3bYcgpYg2cw=
X-Google-Smtp-Source: AGHT+IGK6vlWNUsdBXMOO97tV6CeJy3H7d6/voqu66BZW890IgmHGXwHr/w0y/LBnO3QRqZGHgqK9g==
X-Received: by 2002:a05:6512:1319:b0:52c:845e:3194 with SMTP id 2adb3069b0e04-52ca6e6d4b3mr6821968e87.29.1718616682445;
        Mon, 17 Jun 2024 02:31:22 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286fe9230sm189573815e9.17.2024.06.17.02.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 02:31:22 -0700 (PDT)
Date: Mon, 17 Jun 2024 12:31:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [bug report] pinctrl: renesas: rzg2l: Drop struct
 rzg2l_variable_pin_cfg
Message-ID: <5c1bf20b-7e94-4b06-95e5-da9f99750203@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Lad Prabhakar,

Commit 13a8cae6e561 ("pinctrl: renesas: rzg2l: Drop struct
rzg2l_variable_pin_cfg") from May 30, 2024 (linux-next), leads to the
following Smatch static checker warning:

	drivers/pinctrl/renesas/pinctrl-rzg2l.c:374 rzg2l_pinctrl_get_variable_pin_cfg()
	warn: was expecting a 64 bit value instead of '~((((1))) << (16))'

drivers/pinctrl/renesas/pinctrl-rzg2l.c
    362 static u64 rzg2l_pinctrl_get_variable_pin_cfg(struct rzg2l_pinctrl *pctrl,
    363                                               u64 pincfg,
    364                                               unsigned int port,
    365                                               u8 pin)
    366 {
    367         unsigned int i;
    368 
    369         for (i = 0; i < pctrl->data->n_variable_pin_cfg; i++) {
    370                 u64 cfg = pctrl->data->variable_pin_cfg[i];
    371 
    372                 if (FIELD_GET(VARIABLE_PIN_CFG_PORT_MASK, cfg) == port &&
    373                     FIELD_GET(VARIABLE_PIN_CFG_PIN_MASK, cfg) == pin)
--> 374                         return (pincfg & ~PIN_CFG_VARIABLE) | FIELD_GET(PIN_CFG_MASK, cfg);

pincfg is a u64 and we're returning a u64.  The code here is trying to
mask out PIN_CFG_VARIABLE which is BIT(16).  But because it's BIT()
instead of BIT_ULL(16) then it ends up masking the high 32 bits as well.

PIN_CFG_MASK is GENMASK_ULL(46, 0) which further suggests that the high
32 bits are important.

    375         }
    376 
    377         return 0;
    378 }

regards,
dan carpenter

