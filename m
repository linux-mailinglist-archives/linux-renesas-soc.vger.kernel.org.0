Return-Path: <linux-renesas-soc+bounces-32304-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFFVOnsP/mm2mQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32304-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 18:29:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 609854F9766
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 18:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CEDA33004587
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2026 16:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2613FF8B1;
	Fri,  8 May 2026 16:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EMPQQ4l9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF1E351C09
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 May 2026 16:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778257769; cv=none; b=gtaf6Y0rcUMbxyMVRcB1FnX2XrDV1zuApTomL+rUW6dPVgCZcpRB0ZKhLIJx0Rv2lcfqQw+e/rYDZ2I952LhEm1TdHzsKtlOW3X72iw8Akj9whAyLK2BLeUNGEPc5PwP5MQhVVWxeDGC1wb7Y7Eu28qkJ8nbLswAuwWfewRFAkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778257769; c=relaxed/simple;
	bh=bMyP9BaD/PCksUzPZtT4YtBtuXzutXem8/hGbSSDiXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owVJER2m0NzzbJKJFWyWcADcXjav/Hw/+F4vI0F1JtkQe1Eq9DHfCHIqWCjp6hcLvaaEQQFvxQ0cJNQSp/D3EfqsNnVReHM9+lY3xV5NbA8Ok/MBEYRysyzTzQNjKkVgQItn6P9O87JvNU3i9h7a+S0JnxB+mM0QCbGdUZELir4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EMPQQ4l9; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-364eef1891dso1796778a91.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 May 2026 09:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778257767; x=1778862567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NiOOX/BlUiU/VwTTl1u77ZEF4f4t+Er+IIs4D1x6jo=;
        b=EMPQQ4l9mL2cBqOHw9IS0l9xb57xIa5saM9EFcjOR5NFH3gfRTpK5cN0tgrnRr3ylE
         BfRbDDfHp+XVFhxw+Aph8PYvPPiiGbTTSQEfYkASzZUPYjMSSPMjwXuT/LbFopiYHeQe
         mMixD2bzfFQpIrd6Mkk+z0I9uhi+FffqGdPtakRWcmTpnyHZd4n58FcQdPL6kmS3T8Dl
         sablR0asUl+5CZJ66qdRAZvFI0vmK7d/PkF1b7PkYhMlJ4vd7L3nFJugq3E5ndkOjo2n
         +cdGLsLpAjSvmt+ut6mAmrp84wO1Dnk8cGWBGERwjy9QOS6o5jWDepLcjboEiRaoo0TV
         HBlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778257767; x=1778862567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2NiOOX/BlUiU/VwTTl1u77ZEF4f4t+Er+IIs4D1x6jo=;
        b=qmtLzDqCBAqo8m+cNFaZvXzQWi7d+we7SK9hK5mtX7O6h5xxBzQEm+wZVYJIgzXPwZ
         kUvoXflAKOb1mIbO/vCMNHA3mV9MGHn9AdtIABDFcJl2Dg3eIHxRcE+pimfV1wMxkia9
         uDpq1ERMEybnyKeQxy7HkRpw7XN0ZzYIhZ0fTL4d9A6dt72lsTWMtGnC1jNz+4mR0QFu
         PlG5FWdFZE5DXFabVIVcgSC9ALrcp7VRslt3M4n+1jtyUr5DOfn6ZJ0hINbABZaoUTew
         w1jzXFHTBejPbSQwzdfhXuYpo7PVPJ2GV2IveMrs5QSw6r7gwL6u+PZBtnlnQat91XCM
         MSCg==
X-Gm-Message-State: AOJu0YwNbedpfg5TVbulAi+mqVIvjkmG7wTheMNq2fNldMngE3RZNe72
	xPQZEynkdAWdXMkcjnnASdMwQcsW10IpJvgeXq90lUl5X5tIkGLUdeS1A++4eQ==
X-Gm-Gg: Acq92OH4dtvAjA99UddYUxqkAiPReCyn/OUQvOwe4EzOWSQVfTDIm5OUdvaYUh2xaRH
	q7gWpQ+5Jijm08frbbtLWn0XQhhigcDBK4uA6i8L7vnDUGz3y0BGzQ+0ChLMUdScwHE+wYYjQ50
	YFuMLNiGU3kTXsp57pCE0FE5XDbzStD+sO/6esM9OlsqtMuzYzRE0CWW8dMmn0S+VZlzYGlXM8+
	xaAA83NQuXCDQ2Vv1DFTni1b/uT73gQ0NkLCiWd/mZ+jL6swwZaQgLkNhGSCWqA3PLx9tlGi8Gi
	UdLEUuMSo0Lxtakbpm8PdISZTxSvL5VD91s2hnBKDusNQQI0UvqsHv8SDq6e92gUUpLuAuEEtxT
	7f1Ou8Wb5swYDCclGOn/WJ4AEIFvBJtnhCBPdSWW267yMegt/qR6N2gBShaBw3WmocejhRKbl5B
	/oPzUZcnbPCE8o6A5nDaMlWF8gQgXs2ya4X+hCR+2CWSHmKGY=
X-Received: by 2002:a17:90b:4b8f:b0:35a:189b:43db with SMTP id 98e67ed59e1d1-3664c8dc391mr3471558a91.4.1778257767538;
        Fri, 08 May 2026 09:29:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367c119fdb6sm267213a91.3.2026.05.08.09.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:29:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 8 May 2026 09:29:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v4 1/4] watchdog: rzn1: Fix reverse xmas tree declaration
Message-ID: <dc7b42b1-65c7-4fa8-a001-931df263cb96@roeck-us.net>
References: <20260507102410.43384-1-wsa+renesas@sang-engineering.com>
 <20260507102410.43384-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507102410.43384-2-wsa+renesas@sang-engineering.com>
X-Rspamd-Queue-Id: 609854F9766
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32304-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,roeck-us.net:email,roeck-us.net:mid,bootlin.com:email,sang-engineering.com:email]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 12:24:06PM +0200, Wolfram Sang wrote:
> From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
> 
> Variables declared in probe() don't follow the reverse xmas
> tree convention.
> 
> Fix the declaration in order to follow the convention.
> 
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied.

Thanks,
Guenter

