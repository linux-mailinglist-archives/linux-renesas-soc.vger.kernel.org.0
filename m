Return-Path: <linux-renesas-soc+bounces-27144-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YI7wIOfub2m+UQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27144-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 22:08:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3D34BFCA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 22:08:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D4B5772E3F0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 18:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C02BE571;
	Tue, 20 Jan 2026 18:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JONTaoPI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C70366DA2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 18:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768933913; cv=none; b=K92dlUE/e3sADmi0cgBJEjQCNe3wvCL2+E99hcO6GOx+sLDOAmQqGV7wGJMHtZUHTvvNNJOrht1aapSb9oJwfNMLkJPoYM7GdHFerbembwxSwbBkjtfnIJCNThjlY2+6jyp3Gypg34oZiBm7Elg860Be+XrCtR5otUhvh7to8n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768933913; c=relaxed/simple;
	bh=PxkI9ZEVl95ef0uAgeS0w20WL27T1aoU+i2r2y+erRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqxiba8DZKWHl60eF722nyqV17Us7SPx0/DKOkcZXHDkarKy22Czoh6NXF1Wwom3asYaEYnSEJVUUIkRYrHbQ/lsZFEl0pMfdcMLIi2RQzTRoZjm14JXHilNoF5Yr0bhLIbn0Bv4cCFI0G+SPaRW7x7g1S9eubv6i3XAwLJ1Ivg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JONTaoPI; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-121bf277922so8024159c88.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jan 2026 10:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768933910; x=1769538710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C+oiG92vmpU02Q01PF7tnGA5Qb+9FeY26FbggeLUk/w=;
        b=JONTaoPIogLOwBf186uAsWG4ZD9/b1Dn9JUmiSkssn6E57GVKfAtLGy+Wg9faIYJZt
         0BUr5XqAH7LuvCNlB1q5GYhG3w25b/zUDKzRFD1K/zKKIUWURZnHQ4QewDO0vdkTuHKS
         gpymUDnu73nPN4vMa1EjWZnwotiyIXGrz+E278Vy8nr0oX3IDfNSaRFlbL2OYdMy2KLQ
         NnGwzPpXY21UH/knFMrBgtDnK0txuvF0HlqSMCHCMPsZKkf8zfGYM9f5u4fh8ZLrFNBl
         8DsqLnrtKafJX5kpyKOnAb7KqOcA1d9lW2k1oKMctM5P4ri09TuxPdjj3fHeya3dtS0n
         A/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768933910; x=1769538710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+oiG92vmpU02Q01PF7tnGA5Qb+9FeY26FbggeLUk/w=;
        b=MglwAeQvIpq+nShCYInqgx80AUXd3sICvjLSqRj1gMl+6fHf3EOfnlAZn3gZTbT44R
         dmdZB59PoEEDHu0Hpjd9hMSHIXSWMi1e54/8Peoh2ixQqxeOFDScvYvAF81oFnXbksNw
         PG/6kwNpw3KR6B3NqFChG5ehScYvjqmykCRINvUEjJXUxRHJaqmVpEXTbD7ctVlvwWeT
         4pcBJUns5dHcK86ssuzNKce+WUwZoYsmsdge0B6A8fzwsfRFqgxCltQmGRFHyUzJgvvc
         boLEBSHpSLhBjmOsCr8aCRNFjTAjqmXy3sjzM/tz2MrBAH3aXoBpeVDD00oQCh5j7spg
         vyMg==
X-Forwarded-Encrypted: i=1; AJvYcCXKP5i5qpvW1ecS+a29i5dV7HLAJpMzReBRNfvSkA4DlGWB79Yn6FtFG0FNTlWmy2IfSH7IFelnyU6W8HnHYsqq6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIhDoQykoAhGcbJvLJl3dj71qjLW9NC0HlhM1p1ykeD+BLJ/+s
	SGJvLu2HqL8uaEJl2xpF6HtsBZNR8Djqdfyze4kAhapsc9VnZMoU67Nh
X-Gm-Gg: AY/fxX6BQH4ZvNPJ53F+8dmzy0QRYrG/93H/CBjfpbPq9luOghkkdVkCxxGct1pwUDw
	vn0WkQGUZSWkr9glE7/wxj13CZ//ZWcXxXM6rUpiJYNrgGSMqjqU7J0MTG/zAbLV1GkSvaldCi+
	+clVqViuRGIlC1q3Ob1Nvlw8id/fVzO6DI3c+GHxoKd4YqNimS2wdChT3ZSjRIBPeJcGhyFgh2i
	+trJ9SXzawYdEF6t39Dhdjkyk5Yh9zRw+t4VHBcfzwtmKR1DgZGfUV5PrpFDJtZWEeejA7tB7AH
	UEDO1sbQxigSpBO445vOl1ACQteiamFpyx8I4BhPzXBN7xdnMQkaPdGCnv4wKoFx65zaChcYi+a
	HWv8bu+k5qJMybSRrildi/H7ONVKYHD2DU9pp9xZOb4J/KMki1n7q29qQvBS7lM8gTKKZbYIXOp
	bNJqkmgwHfx9yyvQxbMio7Q1zakSDzyq0Ay4cDQDwfH+q7/n0rMS5iBUPGFVeWiSY=
X-Received: by 2002:a05:7022:2204:b0:123:3364:2cad with SMTP id a92af1059eb24-1244b36d95cmr10423848c88.40.1768933910467;
        Tue, 20 Jan 2026 10:31:50 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:d631:e554:f0bd:4106])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10736sm21990193c88.14.2026.01.20.10.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 10:31:50 -0800 (PST)
Date: Tue, 20 Jan 2026 10:31:47 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Job Noorman <job@noorman.info>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 3/3] Input: ili210x - add support for polling mode
Message-ID: <wv3vil4b4lgfrqt4qnzxiffnniw422xjfdiz4svkklnfrslz3g@yzqc265pj5t5>
References: <20260117001215.59272-1-marek.vasut+renesas@mailbox.org>
 <20260117001215.59272-3-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117001215.59272-3-marek.vasut+renesas@mailbox.org>
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TAGGED_FROM(0.00)[bounces-27144-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitrytorokhov@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: DE3D34BFCA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Marek,

On Sat, Jan 17, 2026 at 01:12:04AM +0100, Marek Vasut wrote:
> @@ -860,16 +893,12 @@ static ssize_t ili210x_firmware_update_store(struct device *dev,
>  	 * the touch controller to disable the IRQs during update, so we have
>  	 * to do it this way here.
>  	 */
> -	scoped_guard(disable_irq, &client->irq) {
> -		dev_dbg(dev, "Firmware update started, firmware=%s\n", fwname);
> -
> -		ili210x_hardware_reset(priv->reset_gpio);
> -
> -		error = ili210x_do_firmware_update(priv, fwbuf, ac_end, df_end);
> -
> -		ili210x_hardware_reset(priv->reset_gpio);
> -
> -		dev_dbg(dev, "Firmware update ended, error=%i\n", error);
> +	if (client->irq > 0) {
> +		scoped_guard(disable_irq, &client->irq) {
> +			error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
> +		}

You already have a scope here, no need to establish a new one:

		guard(disable_irq)(&client->irq);
		error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);

BTW, not a fan of the "_noirq" suffix... Maybe drop it and add
lockdep_is_held() there?

> +	} else {
> +		error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
>  	}
>  

Thanks.

-- 
Dmitry

