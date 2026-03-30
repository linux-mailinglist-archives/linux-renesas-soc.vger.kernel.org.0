Return-Path: <linux-renesas-soc+bounces-30559-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8I+bKnwvymkA6AUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30559-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 10:08:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 128F1356E1D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 10:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA886302D950
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Mar 2026 07:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616073A9620;
	Mon, 30 Mar 2026 07:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="0mCZxl4Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E223A875C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 07:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857563; cv=none; b=VNLJ/EkPuYLOHRLz5VFjAwNgPe29ehgXJ7lzSdrNeRlLV8vifP4+tpIm86dPJ8hl5tzSk4NP7oBRobGhW/18KNTYm/rTn57KtT9BkEAQZoegUGhar1hS0dhQouAAoMWAqzEm570JBDEzpkdeoRprKbirGwepTP4Bx6mYaTzVXCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857563; c=relaxed/simple;
	bh=k6JUuhq42SSwIgVxyv7fWCOM8fhm0hvAp+G2ZzzZ9Ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZdukylnOYlKLwoTllXh91dTdKzPzfnmzrvTsf63hk77+5CZjzMLzzFN5jzGb8FLBvwYaIT5VeoWmpEf4rRxqhKuxgB4LgYsUZx0g8CBs5vZHpp/nKiu7iBIjp4u6/QswLt9xkB3GMTwc1VwfnRmWwam8pQ6WDdqcSufOXgNEilU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=0mCZxl4Z; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d04fc3bf2so91095f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Mar 2026 00:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1774857560; x=1775462360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y35FqnBB++fiJjPiIxMgwhz88Bst+PlLvtoiYEI+bUs=;
        b=0mCZxl4ZaqKtIpnZGqEQ/DTXTNdGzumdnUuwy4ECpbYFzp79oePxMBMjhfMZKON8K1
         uH6ncjMNkKFKWZ40QBrVeud9U1BdtRiMTBUWrobZ20WkG6aErtq/PK4LbsGoF3wurl89
         ZAceDXXBU03MAvQ3+6aUJ2zyeVQ7N+BrbV1MxW2W4fIHIPi+kbmb+PXVDtWHot9yx1ts
         cjqypIYuJu585odUccCwFOPEgyCuSYObisUY6oGM7bNI10a4dnR8ytNjuzJuqKWpPDBE
         CL9wBUHkfeIH0uuKitwnZYBOP6iC6zickBdd2HiepwXDjo6JLMooAvlnNIMtHiTzqdKJ
         jokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774857560; x=1775462360;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y35FqnBB++fiJjPiIxMgwhz88Bst+PlLvtoiYEI+bUs=;
        b=CZAId+i2v8FqfjieZu2nJfVxnjmqn2KZ6TjJJg0xPCn4/gyg42TR8ebK7Mob9IsA6E
         aYIfc/UP0dstAhAlWZKaWudFwhTa4nVajzUPqYEqZ1CX8xtEOw9rG9t3oT+fLOPbTtxb
         zIVRx71cxFOzls16SNyUg6pD88xCvVotWt37ScMrzx8sZrbN5tFaKoAlt8PilN+wy5yD
         7yEDyaNi6GYb0QHicWtpILCbUz3IegVU2/2nMEYqlS4z81DYRvLWwuX85IIJZ0ifWEwu
         fLpupmnBt45u/8TLggn+ZoCcMI3olbo2z5S4hmEu8aW0z9iBneqx2JsZbqOk1FCSXi+p
         KBlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMjhnalisqRjbSfKtSvuF51D8dyTZhUGiCp/6cshs58g/9ffvdASax+5gw6/dulHRx7soSKFouZdiSX5ViN+74TA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkAwvs8KNDupLM75uH7kdDBL7s3I+o7B6ZpsV0h6dlIVKdBO5u
	w0wLasVxa3zUnV/+SwNmUc7V1S0nuz+SJ3qIOnaFPvvNk18BDuIL+YlcrWPb/wvcPYI=
X-Gm-Gg: ATEYQzz1eTp9sRMYQtOAe3kpY+YcYg0okuUDEACLqS80MO82jn8VZUUebP67rrubjA/
	R8jg+TGwaEgJKt58YQRzCXlTDkZDELc/hZ+kP8NafkLJqZU5zRd5nq4gWHWIyyFuF0YjkqCIx/W
	j6+wyfPzrXP35WRA5xlQlqlupea1CGJSBqwePpdd0aB0bJMFh2V3+ddFVzvg24PCCcPF/vs56NV
	BIgJxfMxrSBN61i4BsQuoSPLLI8vgDif3JrtE33RKnK/L7ErsZPTa5pQWG5quSrX9OZ1LeVG97n
	ISm/gXwKJqdR0Jk5lXYkA3q90ASoxCcZwq6HO86qNOEf0zZVLHC+frbZ4nmQX0mAAbHZM3PVEZ5
	pFKwNV85ryFaM6BC8DeIE4EAKbcGHvnub59PUneAr59v5qeuyUNcjdfsoHlVlUlUrsNJWLEGimr
	qANvLFRJj46xWUSA/okFiMMjkthuhRi8SlbskKSKlwoGIkJm4A
X-Received: by 2002:a05:6000:2f8a:b0:43b:47ee:4586 with SMTP id ffacd0b85a97d-43b9ea4aac1mr18960326f8f.29.1774857560274;
        Mon, 30 Mar 2026 00:59:20 -0700 (PDT)
Received: from ?IPV6:2a02:810a:b98:a000::ae46? ([2a02:810a:b98:a000::ae46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21eb95fsm18840598f8f.12.2026.03.30.00.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 00:59:19 -0700 (PDT)
Message-ID: <5cf41f14-e694-4b06-8b82-1d98238758d4@cogentembedded.com>
Date: Mon, 30 Mar 2026 09:59:18 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: renesas: rswitch: Fix memory leak in
 rswitch_phy_device_init()
To: Ma Ke <make24@iscas.ac.cn>, yoshihiro.shimoda.uh@renesas.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, niklas.soderlund+renesas@ragnatech.se,
 michael.dege@renesas.com, yury.norov@gmail.com, geert+renesas@glider.be
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260330073541.2871414-1-make24@iscas.ac.cn>
Content-Language: en-US, ru-RU
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
In-Reply-To: <20260330073541.2871414-1-make24@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[cogentembedded-com.20230601.gappssmtp.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30559-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[iscas.ac.cn,renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,ragnatech.se,gmail.com,glider.be];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[cogentembedded.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[cogentembedded-com.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nikita.yoush@cogentembedded.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 128F1356E1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> -	phydev = of_phy_find_device(phy);
> -	if (!phydev)
> +	tmp_phydev = of_phy_find_device(phy);
> +	if (!tmp_phydev)
>   		goto out;
> -	__set_bit(rdev->etha->phy_interface, phydev->host_interfaces);
> +	__set_bit(rdev->etha->phy_interface, tmp_phydev->host_interfaces);
>   	phydev->mac_managed_pm = true;

shall be tmp_phydev ?

