Return-Path: <linux-renesas-soc+bounces-28645-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LV0HSa8pWnNFQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28645-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 17:34:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E271DCF2B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 17:34:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 411A830BDE99
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 16:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D8E941C0D2;
	Mon,  2 Mar 2026 16:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="A8qCg0m0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE6A3E5592
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 16:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772468915; cv=none; b=HYOCa91TzKldRextwuIACIdU8/lt7HEa4KcvPDE8J20zcHBwRzADGmnwwYYGjXm6IEsHx/6ecl4Sxd1/Gt0E9kZmq5KD3OhLSTYE5Hk/fAgr2xm1H82eayfTTf12FEC9pl2kTZya+7DE/FoTel0rhnTXTMg4TJLMTVnqGc/1VeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772468915; c=relaxed/simple;
	bh=uBx35spdecr0Foh/80vdl9yoCBDNS30rMaVxtcY9Jps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aCthUgQAiM4k99dPSwi+gpYF/4mVA348x/y9Q5G6FzcoewcfYfO57p/B8XuBRZGI2yWfjaXTF54BRYnbRh9Rbf+mIFjrxwAxCQZeg4iXRquOEjLkj/0/qBZF6wKMGAYRz7HthiCdUgTs4fWzQlnFVrQrz8y5kWQMASWuMRJapw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=A8qCg0m0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4833115090dso48435815e9.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 08:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772468910; x=1773073710; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SzwJxqhy0QNK9BireGlunz30/kBwTEVhSwOAZ1SWJvA=;
        b=A8qCg0m0Vidcv4VeF9WHMvykAbOo0fEO+KGUIOqQghcHNPObbQKHWFro2kkwvNxsKH
         Mg3kP3yBKu6d0oUUeYaC4IiuA2rqpRrnJttUdaipGB+bEIua87z7b8N7OUatWK7c67EK
         OvamKkoKhw4sVlyhAnz3HMwH+aRxNhAJxmTb8BluWU3YExHdEEYG41sdcRH/aAeCe/xU
         140MLlkuWbEc4SZWQ0wxwN1Hguy0AD+3qzmT7p+KYFL0fYYJBhWxA+QGJykJx3g+/cz7
         s0M1TpZRNLUNguM61fU+YLanlxpFJk7QsUY2ZL17cv24Q13F+DavF4lePRwL28PpaQqh
         9yKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772468910; x=1773073710;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SzwJxqhy0QNK9BireGlunz30/kBwTEVhSwOAZ1SWJvA=;
        b=K5MzOi6Oj1yobCXjcoOhMhkOsFvFQf7a5XzCVQ+Qe4NY5fjnObrK0RZnlqKv+rOA6T
         8gnHNDhY+Mpdzn1IAJfy/RETwBObEBYkewA13F8jx6TjtBlQnmmQ1TuvXoAWkhYdlhlY
         UjDvfjL1k4wYuwDXdbQUGM0OClQ/4skvvLcxnJ4SiXiJ2BNYAmyfx9Z1a4p4tZW6ICcs
         P1JAhChqK60wdwAViignnETF+8quSHEKp1ty28b9l8fPwPDBE8uyP56uvDTXoCu1r1Zc
         R6nKuljE4Wicm4r1p1HeEPVkiilN37MGr0MhIyoeGO0CsFTn/dzSzb3VoH+v1JiUrOMq
         Gy1g==
X-Forwarded-Encrypted: i=1; AJvYcCWxpaDVXo8uwHSO0/fYzfF2dWkcUIGVqe+wlwLyffUrAILWeO6U2ARMoh6W3z5F65rMmacASY/1x51mHliZ0trxBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXhx8BvQoI3si/JMb4kDPhT6/3AsqLow04gO8p+3iav/ZWHtgj
	yBo63rMi+nuRLepPf6j4OedAlevRU/IvtpPlu9Qms62upeBWlEPGlqlwFygQzcHUWxI=
X-Gm-Gg: ATEYQzwEg47NBFDFo65STdAQok6+b7bQDpRboYAC4fBr28Vor2NpYTTaB2BrGHHP+4p
	7KCNMOpONAbQTTAZWMAsdSMUdqKADPjLRv6idZZf5RonIu2GnSkY2JQkekNsTEElM86yQ5p7Wmp
	0SsIk5ZI9CTFHch7H2etTMySfX6yVFYwpvNB2BuvDqVqrJvhETtAHiT9aKT6aNYeCw1a6dk3R7s
	eGDw9g63XuxcahFryfC3WH88p38FbtoG8Mpv9OQ9OEFXubnQ467GbTC1ui9IC0pWlSMA6iu7GkN
	MvP3Awxd1Y/+yDmkKkr65Z09wPVXhwDRnLKiAHJZO+zsLp1K/GPqBvGlvk7M96k/hX+RTDB63SY
	uX1sLwWgIS0VpRk5n5DQi/E/NrJN9NK/BEeSsJwLTaGLU20Gkf0xiqGX9P1Z4kMRRX6+V+N/i5C
	tSh/J2KEL+nmwrO7seDWxNT+5gNFnQ0yCrrfNZ
X-Received: by 2002:a05:600c:3486:b0:480:3a72:524a with SMTP id 5b1f17b1804b1-483c9bed89emr257432255e9.19.1772468909910;
        Mon, 02 Mar 2026 08:28:29 -0800 (PST)
Received: from [172.19.170.194] ([213.233.104.147])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e6c9sm366337995e9.8.2026.03.02.08.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 08:28:29 -0800 (PST)
Message-ID: <a22454c4-637e-4114-b43e-fa8cb1363cdb@tuxon.dev>
Date: Mon, 2 Mar 2026 18:28:26 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/15] PCI: rzg3s-host: Add SoC-specific configuration
 and initialization callbacks
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260227153236.55988-1-john.madieu.xa@bp.renesas.com>
 <20260227153236.55988-10-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260227153236.55988-10-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E1E271DCF2B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28645-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action



On 2/27/26 17:32, John Madieu wrote:
> Add optional cfg_pre_init, cfg_post_init, and cfg_deinit callbacks
> to handle SoC-specific configuration methods. While RZ/G3S uses the Linux
> reset framework with dedicated reset lines, other SoC variants like RZ/G3E
> control configuration resets through PCIe AXI registers.
> 
> As Linux reset bulk API gracefully handles optional NULL reset lines
> (num_cfg_resets = 0 for RZ/G3E), the driver continues to use the standard
> reset framework when reset lines are available, while custom callbacks
> are only invoked when provided.
> 
> This provides a balanced pattern where:
> - RZ/G3S: Uses callbacks that fall back to the
>    reset framework

Nit: This fits on the previous line.

> - RZ/G3E: Sets num_cfg_resets=0, provides
>    cfg_pre_init/cfg_post_init/cfg_deinit
> 
> Add cfg_pre_init, cfg_post_init, and cfg_deinit callbacks to support
> custom configuration mechanism in preparation to RZ/G3E PCIe support.
> 
> Signed-off-by: John Madieu<john.madieu.xa@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

