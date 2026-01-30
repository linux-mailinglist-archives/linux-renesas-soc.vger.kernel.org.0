Return-Path: <linux-renesas-soc+bounces-27680-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNjxLNG3fGm7OQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27680-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 14:53:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE1ABB5DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 14:53:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A494B3002B56
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 13:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCB6030F943;
	Fri, 30 Jan 2026 13:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="j9p9aum1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBBB30BBB7
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 13:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769781194; cv=none; b=g2DHOvtKkq3n7KYxj5AvXr2dZ9l36EDwzYhXptKEvuHg5Wp9bjD+0WAzQntaoF9WhebAfa/L9HYbtM1eknnOmq715eFaE5rp6kp3jDzndOaVW0JFXt+D6bZG2q47oNNv8APX8ShhBJ9ae1rEBkmsjvl4fgy+LNYc7Kt2DlxG1zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769781194; c=relaxed/simple;
	bh=lwHSW4yFYrq7C7ukeFfwIsI3wJJGF+4yOoFIz+TjZ5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rXtNT8+cfrA6fXp3vQ5O9HEvnLwYUQJOUUujiEPMSNuig0yp9MhNcvoiReK+BYKQ/czLEu42LbV/DveLRdvYaQnhittWOrj7GEsZ/jEderyqDfXiZ4fu32d0f6OMUKjfIBY8uMTKxe2DDngNjmJaNmxKT9TdFy2wRONDfhP0LOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=j9p9aum1; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso22999025e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 05:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769781191; x=1770385991; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fNa01vI1UZD/5USaqCSEKUoS+bCUzsBbRR38Izr8E/4=;
        b=j9p9aum103ASP3lhsVEfnlwSIoGAyxtiSTo6tkByhWegAU0mxqrwxFE3d5vVTHk2vI
         4CoEWn8ekznsO9E2gt85BFVSFAPNjSKf4myuLEdPHVC4oJlv2YBIixcRFwpeH4Gt20E9
         HsazsICOEjJw68HX+GKbQeH2caRhcQyEDy8o8vdGvhKj1Zh3xq+SLg6tO2Tvq+TzbO9Z
         0bPJ4nsoFskMkaP7iWelAxix1SYRGsCtk0QU5Zf1XbEvey3OXZ98FRGCGScn25q1B4mB
         85aH4pU680PVXKpEELD1r7kFUFAvHm/cY8+zb/KkVjlGRMHLB20y0HwBhH9Z1liLsjuP
         ggYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769781191; x=1770385991;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fNa01vI1UZD/5USaqCSEKUoS+bCUzsBbRR38Izr8E/4=;
        b=MCKOWEb3ZGHMhTjUnHJ9PZS69DFZjHx8u1lk565vEjJIxS9Oz4wYVn0UJT62CQahCj
         YN93JOJ7Xkyldeo4upl7UNeHtIwdld9RK1Df/enJk7MA0qagGi3B4NYorLOdt6qNqLxX
         I5q9JRGC0hmKJhMJyEv/19QdVwxfmzqiP6s9KhyqkV9sXXeE/pkktydbgayY97B/wj4W
         cj7CcQN0QwOlCarPa1VckJxHTFNXcmJYYzCLpYBYIj8q2FaEaxzNaJCj0P06A8k6oRx3
         0tKvsX94GW2erPYvnACnX7ToZ9OZ08YS4ySUNrizFN8/TdZWneaNqtyy6PMhYmJxEPxO
         FlCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAMqvqCOyEVEXuDt+evra5wP7nCpcTHw9DRQZUvcGQGi/EL7dU4fSHwn9Oy3He5b85k7XzNK1yHhHAp/aiJSA7vA==@vger.kernel.org
X-Gm-Message-State: AOJu0YypyCqFkknsNdQ24XiqRHbn6y4IGpyjyMX7BTU7jyzC+4KJ2xSx
	7ivClsDdCpOhjMMrjmDwpGFHWRl74WKCr8YBI9vRm+ZZIEuckHHY1M8OLw1lfCqmn2Q=
X-Gm-Gg: AZuq6aISs+gfovtuIQlJWPse6MyxqVUhMgtQW9afsZo2tNOcza8QgRfe0jmHZxqjYoA
	dm4xbZ1UmJ466DA0rTN8fyWpEifnsEKIZV3AKahkh1dWkl8oIZbur/vdy+NT4ELa8kYJOuuzGQM
	tlS2MNmjnmQveXx+81CsMRUhUJDN3GacjExay9QQCiAXkz/eb8SgoofZHcq0/fT/iLgiJKtDRyv
	Z6O5nHHbQkyI0f4xCFVh2hDBQPsF6IoTRteS6zlMn9qz02d0Ci9+yd1eCRF7JaOsgKV2RUK/k0s
	iUQ1l/YMYFwzlleTTXhThDr5zERX4dMdCXkY8SZQkfkGxG3LykTB8uqsDg57j4u8oLSrleHrDmy
	XFAPKR6LLuFOc/Y77PaEfeOXzNu5QtGn5g3prorUV0+n3x47YuVskObJvuOGEqFlI773LmmfVR3
	P8MmUUaP2aO+pvHf0sY+gIDWOB2/au
X-Received: by 2002:a05:600c:a00d:b0:477:89d5:fdb2 with SMTP id 5b1f17b1804b1-482db465e44mr31524145e9.14.1769781191115;
        Fri, 30 Jan 2026 05:53:11 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cefdsm22444151f8f.23.2026.01.30.05.53.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 05:53:10 -0800 (PST)
Message-ID: <d962357d-13bb-4ea1-8eae-e5efa1b9c965@tuxon.dev>
Date: Fri, 30 Jan 2026 15:53:08 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Fix
 naming properties
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 john.madieu@gmail.com, Conor Dooley <conor.dooley@microchip.com>
References: <20260129214130.16067-1-john.madieu.xa@bp.renesas.com>
 <20260129214130.16067-6-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260129214130.16067-6-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-27680-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org,microchip.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:mid,tuxon.dev:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: BCE1ABB5DD
X-Rspamd-Action: no action



On 1/29/26 23:41, John Madieu wrote:
> Fix a typo in interrupt-names: "ser_cor" should be "serr_cor" (System
> Error Correctable).
> 
> Also convert interrupt-names, clock-names, and reset-names properties
> from "description" to "const" to enable proper validation with
> dtbs_check.
> 
> Fixes: e7534e790557 ("dt-bindings: PCI: renesas,r9a08g045s33-pcie: Document RZ/G3E SoC")
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
Thanks for fixing this!

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

