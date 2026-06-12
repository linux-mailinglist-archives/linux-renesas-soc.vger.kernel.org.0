Return-Path: <linux-renesas-soc+bounces-33961-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ss81OadSLGqRPQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33961-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:40:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B40D67BCE4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 20:40:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PBHEfEZ9;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33961-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33961-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 28E033292EF1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 18:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633C53815FF;
	Fri, 12 Jun 2026 18:38:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00BE34E75A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 18:37:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781289480; cv=none; b=erzUxfKCJfWesNig//sumxrEs/WxVprVELtnbSEMWj1dDcDKL3KiP+9+PPzxu79u1GThAPmZZJyEa7+zn3xbOEPh060t0n2K4+OKQmO7eXovnMlq2vLoXLbWBzOhhmFCqV6+8qExd/yUbhVq4ARCCWHuP8mMdU5Nwe2dQr75hC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781289480; c=relaxed/simple;
	bh=8W82XfJlWTHi8WogjndTXsNhr3mflN5J8U4YIyKuno4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=EludzpbQIFti+z1w25Y8QmWy5rt4NKx2DgTGYtFdLm8mUJwaL4inUQEPzUA+hryMkO/C/9K/rady8Ohse06JBJVzut4Q0n+a7CgzOHWXSliWx+Tkx8ha3TxO4j8+zqL8jWBYoLJd+txQYzS+JFqHzBavniAOha9YzcH5ztjVvXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBHEfEZ9; arc=none smtp.client-ip=209.85.221.42
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so1481235f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 11:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781289476; x=1781894276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NlvWl3EekWEv/GN0PGro1ZAvKhVNdp0JgdzZJ2rkTtc=;
        b=PBHEfEZ9aZJIyxjhHa5Tuog2byM8RF0QKhJdqDCDsGD/v51mepjiHjnnU5urPcLPo3
         lA+WGs5RYb3pZlQlcB2WY5L7MNrnTua/T1vMvDDKfqm9qNwm7QRjuq+o2d4cEeKUkpZ1
         6GEQp+GefQEkrVcTLtMaUCGjscFTdKhCwNBKH2PtxgdfiU9K+QlIO8fhobSq0dOFHkGN
         UiJAH3iaPrVVR3BWNliIb8MBZ1MJImc7ZKtGgXhAt4LgFzwUKO167w/DN6woENltOgmW
         GMgVdU2PZYFf+ytBgtGOXTJn7Lyp0Wf2NgaYDRAzvV3uknQ6p58hPNftR4JVvMUwFqiq
         4eww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781289476; x=1781894276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NlvWl3EekWEv/GN0PGro1ZAvKhVNdp0JgdzZJ2rkTtc=;
        b=roFfigPvJnOK5LrPAu6URBVUf4cv3U8iyLwRbjSj97VU6KrSdoaMFUx3ne3uyetn0p
         C/8d+AEgdYfbird/6ZdeqqyTSzvPtZbvxqD0KBCi/cbBwPZ3Ola1bulIekxPlG4tXrFb
         hUJjSG59lQ4p2C1k/z1Yz+HdvY4jDpxN1lcizWmEyBRjKc8D1zNuf6sopYYp/mwKRa3Y
         RdRZ/irNKaBK3bxFfGWxbiuyF9ECfyGKbgvx/otO+7kIbYHLmtR4heXmuJrvz0PrN010
         bJBF/BpCP/X/IUCqR3mUG3z+mDDkeNjB1Eui9vIyEZHYfIauMJbRe0SfIGywg1iqKLdj
         Us+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+1Po1t2gNwf8Z5ZjxV5JfgG5nRY+JP6LZL6J/PrrEVbGF0U046C/KgCYJJ31iOTv9VFk6MppYvxQ3zEa0z1eSc0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxUhydKfqSLczMn7Z6cbYpqH7Jb3rzXQzrr7tNnwOVed8D7mdYM
	RxGeSnJZPrfxasbWNCvYS0BS029iv+IiMCO2/PY7om8ZnveCUAYcyih0
X-Gm-Gg: Acq92OH+AfNInr8HnRz4fgYv/4mtgpxbXnDAawxg//q/o7+jKkBqxBTOHHkZlJ+vDqH
	9O6YCzE4rIh3jZ2pe20cwFjVlFmY8B10VYfz7AZfcX4q4Slhxzyy2hbfn5D/HtQGYDgM+Rja8V+
	WW1N28gY7O6y/HsOb4rElcXaXB1Ufr5Lbt8krtdWqDllF+6gymXc8er1q+vy1Vem+AxIxH9e455
	TqCSM6apE6cuAWF3sIz0SEhOhvOE7+AGMcNasW+UlMY/t1HgdFSWd3wA+XsCNv3l34p9XZdpOrQ
	fWDrijw8m9OFWKDL43Rs0VyFXfEupdwnEW8G19YvEo0s971Dxprp8UkkXU90bC+NzxJyCaFLG4W
	sVrp+nK18/0e5/sgLne9HNgzIhkvlC4WlIlUL8/rnhGBddhSK8WjdPVPCpIOvI5DZsAfWmT/bxC
	8Sjp5lQzAZKOIQaaiJO7ACdbQhv9hgpnyzp+sgWYIAdYObqdkO97KDRchWwKF5Ud8qvAUDcWqs4
	MzwMpZTYO/7Ww==
X-Received: by 2002:a5d:64e4:0:b0:45e:f387:77a0 with SMTP id ffacd0b85a97d-4606d143d7cmr5783680f8f.31.1781289476293;
        Fri, 12 Jun 2026 11:37:56 -0700 (PDT)
Received: from ?IPV6:2a00:1fa0:742:25a:e03e:6c9c:49d8:2fee? ([2a00:1fa0:742:25a:e03e:6c9c:49d8:2fee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f263945sm8427698f8f.8.2026.06.12.11.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 11:37:55 -0700 (PDT)
Message-ID: <3e0dd665-bd60-4a70-aab2-44ffd3ffce08@gmail.com>
Date: Fri, 12 Jun 2026 21:37:52 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next 8/9] dt-bindings: net: renesas,etheravb: Add optional
 gPTP phandle for Gen4
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?=
 <niklas.soderlund+renesas@ragnatech.se>, Paul Barker <paul@pbarker.dev>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260610102432.3538432-1-niklas.soderlund+renesas@ragnatech.se>
 <20260610102432.3538432-9-niklas.soderlund+renesas@ragnatech.se>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260610102432.3538432-9-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33961-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund+renesas@ragnatech.se,m:paul@pbarker.dev,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:netdev@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund@ragnatech.se,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sergeishtylyov@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[ragnatech.se,pbarker.dev,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,glider.be,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergeishtylyov@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B40D67BCE4

On 6/10/26 1:24 PM, Niklas Söderlund wrote:

> The RAVB module on Gen4 have no gPTP clock as part of the RAVB module
> itself, instead it relies on an external system wide gPTP clock. The
> gPTP clock is shared with RTSN on V4H and RSWITCH on S4.
> 
> Add an optional phandle so that the RAVB driver can find and use the
> gPTP clock. Ideally this should have been an mandatory property but for

   s/an/a/.

> backward compatible it is optional. The RAVB module is capable of
> functioning without it, but can in such cases not provided PTP
> functionality.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Sergey Shtylyov <sergei.shtylyov@gmail.com>

[...]

> diff --git a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> index 1e00ef5b3acd..7bc910ab3ae0 100644
> --- a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> +++ b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
> @@ -122,6 +122,13 @@ properties:
>        Specify when the AVB_LINK signal is active-low instead of normal
>        active-high.
>  
> +  renesas,gptp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      A phandle to an external gPTP clock for Gen4 platforms. The property is

   You're sure wa can't handle that with the usual "clocks" prop?

> +      optional for backwards compatibility, but without it gPTP timestamps are
> +      disabled as Gen4 have no gPTP as part of the RAVB module itself.

   Again, I'd prefer EtherAVB -- to comply with the binding file name...

[...]

MBR, Sergey


