Return-Path: <linux-renesas-soc+bounces-33819-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BqRSJaQ/KWr5SwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33819-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:42:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D448668639
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 12:42:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=uHew9rKW;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="R MjitKj";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33819-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33819-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73DBD300F18C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 10:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27DCF3EEAFE;
	Wed, 10 Jun 2026 10:38:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACA43C0624;
	Wed, 10 Jun 2026 10:38:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781087897; cv=none; b=NBEtnc1ujTUddjL6oDYKzuKOT1o7Om51Tydw8r0oilgl1OtUx7hZaGp2qXXyjv3r5ii6L4NUslk9HYYeX5ON9+mOP6V+Ppp9SKWQdoO2qED+ytgeBHYa98oeaEu2dh/SeOKPOxvEUiQkr/xNnDBlAdZtKZQ4CaI6HzKN2LBi6fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781087897; c=relaxed/simple;
	bh=o4YtGMTfnxaq6zA3t5OayZWeNPx/RSslucKg07HktBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swWDgtvZ0krS0mTafq6ry152G3lcbOeyQeiS4I91RWcJjxZIMEHDS2ZrUuGnQu7gVVTS1K31dpGxRR7e44xfSRGobkkgvFbojYo7aQkSU1vXf0MC7RGLYB+t0nRrC0Tke9MVanELnH5yzvsBiR4ixy0ZVnccmsBOiImuouynHQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=uHew9rKW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RMjitKjg; arc=none smtp.client-ip=202.12.124.145
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id AAFB51D00109;
	Wed, 10 Jun 2026 06:38:14 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 10 Jun 2026 06:38:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781087894;
	 x=1781174294; bh=UxByxHojcW0/JpsnKuo8fRJ0BcEM0zLPVToHM/MysCo=; b=
	uHew9rKWzoszihGiTWg3/lWpwKHuox+Vdd3U9NI06jlwnsJjdXp30yN+IqTfg9Ob
	nY1SRJJnNVN2auHvFHyMzNIE0RfsMtkvU9Bp+fZz30oxSfZL8tz5jcqPWZ4Eq57S
	JFYwNilOik3PmEjuonLT0bbmJh/FyoiyCer3QmqwY3dl1h1hcO7IEAv/sT2DfKJL
	nNP0+p9UU41TkbXKw6ZtnL6BuHxcfYNd9eGgU8Y12aFOXhcIms7bbj4IDsPVlsyk
	wRxw2fw5gVw3KP5lfNwGFhXptuPznsZHvWnLqlKzDEMWrHMLvp31zNO0rrkMI1hh
	1pI9+V56vTSS9IxuxpP5BA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781087894; x=
	1781174294; bh=UxByxHojcW0/JpsnKuo8fRJ0BcEM0zLPVToHM/MysCo=; b=R
	MjitKjgirUdQQ+M3jM2jwOutDCe+xpKKOzYc/YlInxDh4/m/EwteYdTfYbNv0jw2
	/dHy/eJ3P2JeQ7vDyL4DATH5QnLKk4lmy4HV+5NkV7r6ssLY02NTFHgmffY/uVan
	2JRV6k4H6MNe9xEfF7i0WfNMb872xVEgTQMkOaAt2fXf7XJzQnxDKuZzbfNB0Tw/
	caU9sdJvFtsIF7ar66QA5LlKjQ5O1XNBC6E6XiA2L+aLg5SKk1Xf2AZLvGH0DHDD
	zJm6vy1sXCYuHnRYgnIKPGMsbyrUrd5mo5hY0Ap38FobV4oNspyc7R4BQ0Ay4zfd
	gT/JAD1Pl5QICZqr96NVA==
X-ME-Sender: <xms:lj4panS_-gZTbrvkuwjW2sumMnP2QTW7oeoohx31TJFHnzFKH3nAYA>
    <xme:lj4pahhY3vTbyjoT8cgYWzP6HkZHF6Dwe7ocRgHLZN_zqxslHaLERV30qwJkTHG_Z
    HgTs140EOE_06v17PoMYBGcH65XS7N0lbpRzVApyr1AmIv8-xh8plc>
X-ME-Received: <xmr:lj4pargxkFYDrDBuQJKQMHpFVA9VPUFj-hZ-77Z_hqaFIDtFMxMJqfBcGPzBDD7348xH-LWsrrIRv8dkPCWrGg2IntyHezNLVGSG>
X-ME-Proxy-Cause: dmFkZTGzmK9+1npgBE4CNVzIG4Tn/S4vHqOE7oZQiD+7505Ck2MZDti7w3iSKVAti0VrEC
    /bxbffDkYP4BLzXd/j8IIbJnxpzP/Zw9CSUQ1IPvdyZPMQ8oSM1h888VyoFOiSB9O84G9R
    zZXZH1NixE29/8MA4hXbQnoWSrMZr+hq6n1O7zFVi6nmgBCAIc+z3dhBWH9CQpFAHqPxVB
    HvecRZ4wCKW4q2rzJlHzZQyl5rxAOBCisl1OcH6DNH3r85vZh8jJgsmJSfFt3vjQPgNcWN
    W3K7knDB1HDvhsgw100s2QwIEEO6LGqZ/l6nHTOkhKmIck/ypDGIP+eBaHy9OxqvMRFCRj
    FKw1TaPm45X7e5RYx+G+sV5dtMnXNkGx86t0+3zdd7GGQ77asejzaLvUqpacJoCNZWWL3N
    BXqSv1RPdooQCnc7DGqwWdzV2l/fQh4SKQFc0AItLfpDLHlhCvXV3tNdHI63Ky0NjzresO
    OprDDZyMH97IGnW9+6HKNcssvL/unL22++1e2dh1HFhFlGww6s2pEf3lYvLbLpbcU7wUO3
    vq5KwlcuzweOLNvBAzYlMFV50fdBGrPUQByLzIhl78FHYhKsfhDolBKeH4ki/xpmHn9A1A
    I0BhrUjSecd39Rh1xLrjgVS+lwjpsD3ZPJBQ/5kzAUk0ZKKxUEtcOkdeFTdw
X-ME-Proxy: <xmx:lj4papYSyy944gJPIBpN5PzVNedy_7K3cjzGqQ2HJMxtNNZfkZXQWw>
    <xmx:lj4pakVtKJ5UHOOvqWDcqRjxV5ZoOLEKrtCp_EmHdl5hxOZxXCaEAA>
    <xmx:lj4pagg79T7-0T06dvmUhu_TIqVnpJhWo3AlQ9jIWtHoHycgvlQWyQ>
    <xmx:lj4pavlbeZJLVRL8OjYPDv_egCFWheT7QAUVmhVztrKgEg55p4fPHQ>
    <xmx:lj4pajUj6TKEel0m-XsZN_TOVOkKXIZWTt_f9NkLcAq_OEEaWCg2M2mH>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Jun 2026 06:38:13 -0400 (EDT)
Date: Wed, 10 Jun 2026 12:38:12 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [net-next 0/9] ravb: Add gPTP support for Gen4
Message-ID: <20260610103812.GE2465390@ragnatech.se>
References: <20260610102432.3538432-1-niklas.soderlund+renesas@ragnatech.se>
 <d525a1f4-9e87-40cc-9878-2044e5d6dea6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d525a1f4-9e87-40cc-9878-2044e5d6dea6@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[pbarker.dev,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com,glider.be,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33819-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:paul@pbarker.dev,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:richardcochran@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:sergei.shtylyov@gmail.com,m:netdev@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andrew@lunn.ch,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:sergeishtylyov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,messagingengine.com:dkim,ragnatech.se:dkim,ragnatech.se:mid,ragnatech.se:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D448668639

Hi Krzysztof,

On 2026-06-10 12:27:55 +0200, Krzysztof Kozlowski wrote:
> On 10/06/2026 12:24, Niklas Söderlund wrote:
> > Hello,
> > 
> > This series is the second part cleaning up how PTP timer support is
> > implemented on R-Car Gen4. Currently there is partial support for it in 
> > some of the Ethernet devices that can use it, but not all.
> > 
> 
> Second series doing the same...
> 
> Please use standard email subjects, so with the PATCH keyword in the
> title. `git format-patch -vX` helps here to create proper versioned
> patches. Another useful tool is b4. Skipping the PATCH keyword makes
> filtering of emails more difficult thus making the review process less
> convenient.

I'm sorry about that, but as this (and the previous) series targets 
netdev where as I understand it the convection is to use net-next, or 
net, to indicate which tree it targets. When not posting to netdev I 
indeed use -vX.

I'm not sure how to resolve these two. Would [PATCH,net-next,vX 0/9] 
make life easier for you?

> 
> Best regards,
> Krzysztof

-- 
Kind Regards,
Niklas Söderlund

