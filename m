Return-Path: <linux-renesas-soc+bounces-32307-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOCOJx0Q/ml6mgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32307-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 18:32:29 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5774F9790
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 18:32:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A14CF300BBAA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2026 16:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 543EC3264F5;
	Fri,  8 May 2026 16:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="riXHkQPD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EB72BE7DC
	for <linux-renesas-soc@vger.kernel.org>; Fri,  8 May 2026 16:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778257947; cv=none; b=eA1EBv4s+MTL6/40dmWPipEjZk7MJ5GZ34tn6yWfnX2jXbva0sutssfIpkaeqBJpaMTy/FQY4CXy10JQX8j5u9iJcRdxfPgUGlleFDetFmQ1drguCswXDcITyVg8GUaexeiyjl8zN3CGKsg8kHCTW7pEKsQ5/9esUc6YlgKVe/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778257947; c=relaxed/simple;
	bh=GWIbRu7yojEgT6ggCcPoA5yjsOKw95UadSdJiJadnWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XapvFoEh0zm5OG6XhbjdHmq6Yt90LTw9Edz7k58c3e1xc69wntY86wMcNvlQX/wK++LLtqBcjtlXB0acEC+RcYLH5RS1VS5sjmn9wUm7J/LDLaGVGqcDvxDwUcIZrbTbnBIXHG9LjEEUSAVu41H8+8mo6/vp177fascpwCx8E08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=riXHkQPD; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so1005537b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 08 May 2026 09:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778257945; x=1778862745; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qI2eSrUIuw6745cX7kAtjWSrj9maOslSs37JhU20zZ8=;
        b=riXHkQPDRus6Byi4cR+bUex59EinOYk7putUMfhKHSxkW2c3Ey8tHuJo97YfIRV6Rf
         fKqKvur0kEBzZHxX8gxFhunGVs8dS6w8czyMuPmxgJpbsFDr0XFcyd3J+yPga13ZVJp4
         2eZ15ODNeb1VuJOe0qbHK7Sb6Dfm+4P8CKDpdTTQWriy8f1vihQuBv8ED+Remt4m3SZg
         7Z6Hj0iYYFu4dyQLqGGQZNGy72vhe2zgJn/T+Qo1tiaeh73hPA0byV1jbRyu9cmafRBq
         bna+7xxxi63j80sUEbga0OgISngHwarA0lUYYy50q4KwcVjY7UOtGmps3WTM3sCTylxR
         U19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778257945; x=1778862745;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qI2eSrUIuw6745cX7kAtjWSrj9maOslSs37JhU20zZ8=;
        b=VsSudx7gUBD+Um6Isz2Q3gQ0V8BnCb5jtb+oGV7gT1N7Mzc5CwEPIHfDTdwIX3JFE6
         T8Ai2Wy/ENVAFzb8ftqaDG9zjkohTNKzICsxHelHvLgfiHUkGQcr2uIdvR/Lqt5k9fsE
         fV+2dL+DgSwirarSodRoASPafIkRFuzOkpnkWYaHsQrE96C6k8wwS8BlWhObS+GGwemA
         3xgJBM4YuRQpDapnd9PlBVj9S6eds/21RsLuv1enpLCjQm4WbppEWx5VsnprnINhJs1c
         OHnObkZZlrEiXY3C5IpVVAYqmZMd/I+V8neMAHYDxtz1uRFqGQ96r++LfyNQeowGBELF
         Qy4Q==
X-Gm-Message-State: AOJu0YxhkXHmYSRJn0ayK765uIHJ+qn8LHn33IYsRR36MiaOVlezsQ3u
	wGaMjMdt3deuNulfvFbMU0aNM/oDHQxClB1YePzQM+isB0khyhpFpJ6B5IdUTA==
X-Gm-Gg: AeBDieuRXzQ5e9LcVfb9A9yUXNjdRT/xSyJYz/QCr6H6cBWcf3umMp8DpQV687jaZ18
	HEURCfl415Wa+GBvNL2RWn3974T1oJWyiKT2R7VP3iWBW465/rfFc41yESyNl1jJeXAnp2Tnbfk
	t8730ZjJOQE9Tbr+HaEgdHP9klTDTyrUpLMtCJFdEBQudubbAJ6tkJi59V8AOMKH5VCNebt4Pkx
	IGU8Hh4+J41QuRjuxWHkON8rTq7TgE92qXzae0qKxlS2ATO5fZsY31zaP2PFGrrmPr4u3xvCgJl
	upCA8OmIls1wsNlAzMVo0piE4NtHTSCo6CHNTpwDORpdJ7sgGro9D7YaqndZtnzulKYpVsNlAr4
	vEVfK1Pe3kQ1jXSAR8xuwLldAVzy0L3lYqlu4WDuJh4lrIHMJ6uacewUakWHGufgzIhNRiIvZiH
	7xLdfbczhqUPWKNO9wAAbNz/HNNlBOr6SSjwGq
X-Received: by 2002:aa7:8890:0:b0:835:685b:8e36 with SMTP id d2e1a72fcca58-83cf6a38ea5mr3684067b3a.29.1778257945345;
        Fri, 08 May 2026 09:32:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839682a52cesm12247875b3a.57.2026.05.08.09.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 09:32:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 8 May 2026 09:32:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/4] dt-bindings: watchdog: renesas,rzn1-wdt:
 interrupts are not required
Message-ID: <72cb3b5f-f669-431e-a02c-81537045254b@roeck-us.net>
References: <20260507102410.43384-1-wsa+renesas@sang-engineering.com>
 <20260507102410.43384-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507102410.43384-5-wsa+renesas@sang-engineering.com>
X-Rspamd-Queue-Id: 3B5774F9790
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bootlin.com,linux-watchdog.org,kernel.org,glider.be,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32307-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[roeck-us.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@roeck-us.net,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[roeck-us.net:email,roeck-us.net:mid,bootlin.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sang-engineering.com:email]
X-Rspamd-Action: no action

On Thu, May 07, 2026 at 12:24:09PM +0200, Wolfram Sang wrote:
> It is now understood how the watchdog can do its job without the need of
> an interrupt. So, it is not required anymore but optional.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Waiting for DT maintainer approval.

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml b/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml
> index 7e3ee533cd56..0e4b5b529e9c 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml
> @@ -29,7 +29,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - interrupts
>    - clocks
>  
>  allOf:

