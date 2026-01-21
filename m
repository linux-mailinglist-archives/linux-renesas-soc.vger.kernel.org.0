Return-Path: <linux-renesas-soc+bounces-27238-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IFzIZotcWmcfAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27238-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 20:48:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8245C835
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 20:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 173DC8EF708
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 18:07:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A03E354AC0;
	Wed, 21 Jan 2026 18:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c7QJ7UVs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA47821767D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 18:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769018856; cv=none; b=ogTG5Iz5BajnDBC2nIOX4hkQBiWJI++XqRtTpzMsGhvHJIEm/1PXH8pGQ2t7ncD5H9z9GgJQlG3CWZ/xsxd3QPBarL9HHrBsaHD8XO6ZiEBoKlmauURItMtxD/n5BnIjck37pONG2vO8ocTNEVtv4iRjm7SQi/C54xErD/KVsfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769018856; c=relaxed/simple;
	bh=0wix78J+oRKHXLt6hmkz9fVUcHgh7+lJ2gOgzCD/oXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B8SG4/XrFpE84TPVV/FXv8HZ171FkUERMQgIm4rFMh1yaO1Epim+/tYvD5WZhB7tPdNdl5pshSm/uRJ4BrDCFo0q1eyDlmVPTw9et4R7jISbTD1TsXQ0a0e0CXpueYBuj5Yk6klevxKfS5B2wowHEKoNqrsrTUmtxPhaYfBC4QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c7QJ7UVs; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-47ee0291921so1211585e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 21 Jan 2026 10:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769018852; x=1769623652; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nL8x1nhynzlORWDLr//wqOzaruj70zMwzKxcsaB/Ebw=;
        b=c7QJ7UVsd+TuyWE16el0eX81HUT9pCnk06lL2tgZGUWpB9pP4kMKma5JRL4qQbXz/H
         lQP4cAPbxegP5a1V4xVEf/Aduw0DFQyltyl9StaZ4U4r/3nCQ9Q6wpg4AvEBvOF6Vd6w
         wSyVLXuztxuC7rkrtXnfZAZBP8XWgq8mNNrooPLRy8nVyY8u6pqmIxyOf5OsBN5mvFXj
         97BMrxOqqgIotilBrdGbXTKCF7uJ90cEJWVTdAHhb7+WLrDSgWbxavGqx/eO401Vz5kH
         rgBI0ZgRMPULCQXDWAdfPbY+Q5BCvEf1qgHyp/5PsXuKysz98WimgHr3HJY8dTHBl0iL
         /tTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769018852; x=1769623652;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nL8x1nhynzlORWDLr//wqOzaruj70zMwzKxcsaB/Ebw=;
        b=wX8XXD002J9MqcX2Jo0pJ+17G9TdJ/0FotGDBSLWfVSxsREvNJh/eoi+qcJVFp4sP9
         iZfJtHOcEuKIyCHWb8jwxJGyFuXubGFX6Yit+i8bjjB5Af0tW7ZowzvNmT3DRJDivC+e
         PfNB6WZXiF1oun3mr/X/+IAjFS4lX3dGvD+XeXygwLspjfD5exRpzlVhsydBw1LEx6G/
         dP+oTReKZ26xeqWfLF9OTlu2+HpngbCNLupfwR97+Wmo3vj991T9QQVpjwSM8xwGlWFS
         x/4w3M5tfkS/mm6rH8JJAWZHhYOZjhsrl6uphPwGPHVMupX+6+z4MVWXbcInQ6iM/Pjl
         IVeA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ8erpzxg6730lbsqK9x0yFDnnNxEYaHR36Gmm+uBC0MaOayEAGRWRk34ZcCLF3MPaZSvhEjhBNvVa59uph5dIDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuMElCHTNfFBQJJCUeSfvLgyCtdymcV5I959bvC4e3itJWwCi8
	uMns/zYwMc1AJOCegE9b/RRV/mOiBVzeEJW+cZg4G57VbiHRgaECEDMDXHNNSt5oaLI=
X-Gm-Gg: AZuq6aICQ+zb4c8YgysRl28n+zAjeKVHX5p9p+hs3fhgUiQz5SWHDDV/Gi2Tx+fUxQj
	E9kw2hc0rimTlCkZyWoOL2fvMePDQm/q9ayCY6STXRhPOB/WIxBKVkR+GRqz3n71Ic1LGdg/ZAp
	nwf93xa0VycYjk20akUosnK0F63dYB7ypFICV0nErG2BENHrumBkYZP+hT6d+aQlGfjFvPZrIi4
	mWjFpVlDCSJEuD+rOlmGlaCNi/vwBDnXw75MzCx+w7hyh3GX7bJrKNQsOnc1QoCJgshOyrN1KHO
	UBaj7zcsJ/koB/EJBV/5Z/8KGAMkRTSIpKICB5UKOZen1a+SEQ+jmV52tbN2WeNbrOQY3SKxN/K
	dxp5ue5uQahSEJfXIA/g18ffCR/8c/uqQEAXT4StmfXSEcsyEYJbKXZKDvVYHdHOc52G2octOPB
	M4rhyIe3ejfR1cz95TyEXSZrD4udYVt3sLIvgnNT5VQ2A/PSatoz/sG2Qk8Cd546UUtg==
X-Received: by 2002:a05:600c:811a:b0:480:1dc6:2686 with SMTP id 5b1f17b1804b1-4801eac0cfcmr217187915e9.13.1769018851700;
        Wed, 21 Jan 2026 10:07:31 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:c29a:525d:d900:4d71? ([2a05:6e02:1041:c10:c29a:525d:d900:4d71])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-435a431c189sm2135611f8f.24.2026.01.21.10.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 10:07:31 -0800 (PST)
Message-ID: <eea8470c-6659-4d9d-9b91-28fbbd1d2814@linaro.org>
Date: Wed, 21 Jan 2026 19:07:30 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] thermal: renesas: rzg3e: make reset optional
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
 John Madieu <john.madieu.xa@bp.renesas.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260108195223.193531-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260108195223.193531-2-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20260108195223.193531-2-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27238-lists,linux-renesas-soc=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,bp.renesas.com,kernel.org,intel.com,arm.com,pengutronix.de,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@linaro.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	REDIRECTOR_URL(0.00)[twitter.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,glider.be:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,linaro.org:dkim,linaro.org:mid,linaro.org:url]
X-Rspamd-Queue-Id: EE8245C835
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/8/26 20:52, Cosmin Tanislav wrote:
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs do not have a
> reset line.
> 
> Prepare for them by making it optional.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: John Madieu <john.madieu.xa@bp.renesas.com>
> Tested-by: John Madieu <john.madieu.xa@bp.renesas.com>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

