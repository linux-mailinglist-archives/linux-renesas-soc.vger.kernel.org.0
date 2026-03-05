Return-Path: <linux-renesas-soc+bounces-28878-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEL3GkF4qWl77wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28878-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 13:34:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E335F211BC6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 13:34:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4459F3011593
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 12:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023083346A5;
	Thu,  5 Mar 2026 12:30:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9685C34A3AB
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Mar 2026 12:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772713800; cv=none; b=dearZG1SjJYf4wRdfAIs7nVGpNV10tZjwhFjfqbwI7M3sZr8qNoTROa9sNxAk+UpZNWls0m1L5GCvpdYtIagPkYTImNtR9FRuTLprUBmhgBTMxbL2IrgU0qN6Upq3BNlXld18aqTq6ItLtzUsAFlX+HhJAZBWSPECFkTTcO0/YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772713800; c=relaxed/simple;
	bh=4D2Q39ZrE8YmvazKvKW3aF1/g5Cpv43ee/MaVGKVTBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjHBZpvc041oeFnbeJcbtD7FVgzFw7BTtj2KF9pCH1ZJ1aJQs6q36XdxJhg9OhbcVnKzfULM7aEHjRnA13X4UqKt2YXRcUgQb0atUfZv2kRaH1b1XLtfFb6n4IIdZAW73s0quD5ZvDsaFSEtpwRNH462UWQuK/LykB1D78+IUW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-bde0f62464cso2835025a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Mar 2026 04:29:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772713799; x=1773318599;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QrCqdrr01xMGx/SCx6YPhCapPZnumyW3whTx771nk9I=;
        b=oqJDgbeNwlWAKkWY6W1NEegH1wlscX9sOgHclDefqmlwmdkUxIMhcdiBaaL39R67ty
         ISWZ9wI4oEsrBnIQQLweQN2QkigDlDivAdiuTVamdaMTWMNowsVyKrtnAQg1JWSjQQsT
         jx/uLP+AZVFWtooGAImTvk9e9FMq/2yqTyf4Ciqc+efclSKwPj9yc2lypfPKAenk2Zlg
         113vaS6rQgxtak/UfNx3+cCS5f/NsAzV1cR5v87XcGsvh9RJldcMTxsUXCxLw8ZWzulK
         1Qx+JlLQpHCNZqAkO/v7hBvtvOnR4iVNwTOilN0ie97sw5O1W7WLQan2p8/lGJOSnuxy
         8HDA==
X-Forwarded-Encrypted: i=1; AJvYcCVI+WHh64aBRTt27Di6pTRkATFgKfY5+CFUiTGSukRUk3BG4dEFo/YCE5GFdSK/klTQnom8tIsQeMULJ+JIE629qA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIjkJ8BN5zFLG22oAASJfryO5FZ4Hdoerj6l+KWwEOGCeRFQdZ
	f002wualSjgYv3vjqKCSOTDchXWIvNJePKrjQuULJnmabQTrWAf0fiKo
X-Gm-Gg: ATEYQzygVkJcf0RONYwajwzgSK+VmnCU9shu4Gt305o9A3CTYKR9klu0mpUOJzMHpfi
	9x3qSquDKQTUI7iukMhgOGxLWTcWPaxgWfyO5zOF4+oCcL7DiOddATqgOwis8bkZp9PjPUosPuu
	ToS9t7sEPjBUlVzQkxf7p1feXRxZ3iDZwM302p4yiUTWfwEHXDLEuxJMNoMY+rDKAFgNSD049+U
	RL9xom1Rtw8lnFswo2tdniJvkZHgq1VixM19uSi4gOLfrrKInYn+5Oufkip/FdHCSyRd2A5CzyT
	YQwU9lvaZS1l8BEUJv41qqZQaXzq1+WrGt7bocr6/j3aHnsjRGH/2R/8my5b2Cbm96aCiqX+qq2
	qmpXQFk6UOb3lRsp3YbsTGf2yxMIldEYgiUk71e9b/kbtOERnw1Lj4sUnlhdBd+yLuNx7S2W23o
	+WTIm0u5O2QaW6vPJDju5NGdVQ1Oa+DAWzjceaDf3Q/U+FCVZR1OMRSPfSFdv/J91D9OFrq+WL6
	Hs/PiIo3yYRkBV/yy5MKz9towpBTcGvWWyH1rplGZqPITSI0/4=
X-Received: by 2002:a17:903:1a43:b0:2ae:4701:3c31 with SMTP id d9443c01a7336-2ae6a9cc1c0mr59976385ad.11.1772713799017;
        Thu, 05 Mar 2026 04:29:59 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb69fa43sm225561035ad.46.2026.03.05.04.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 04:29:58 -0800 (PST)
Date: Thu, 5 Mar 2026 21:29:57 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Joe Perches <joe@perches.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, spacemit@lists.linux.dev,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH phy-next 22/22] MAINTAINERS: add regex for linux-phy
Message-ID: <20260305122957.GA1652563@rocinante>
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-23-vladimir.oltean@nxp.com>
 <a8fee1cd-1e69-4a9e-8533-c0988c480fb9@oss.qualcomm.com>
 <20260305085148.7cwo3yflp7vcfldf@skbuf>
 <f3a5aa3df78553ffc0fd0024f5fd36a4e2158c88.camel@perches.com>
 <20260305114352.2f7btqixg4tu5bzl@skbuf>
 <20260305121532.GA1649635@rocinante>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260305121532.GA1649635@rocinante>
X-Rspamd-Queue-Id: E335F211BC6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.86 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linux.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28878-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kw@linux.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 26-03-05 21:15:32, Krzysztof Wilczyński wrote:
> Hello,
> 
> > K:	\b(?:__)?(?:devm_)?(?:of_)?phy_(?:create|destroy|provider_(?:un)?register)\b
> > K:	\bphy_(?:create|remove)_lookup\b
> > K:	\bphy_(?:get|set)?_drvdata\b
> > K:	\b(?:devm_)?(?:of_)?phy_(?:optional_)?(?:get|put)(?:_by_index)?\b
> > K:	\bphy_pm_runtime_(?:get|put)(?:_sync)?\b
> > K:	\bphy_(?:init|exit|power_(?:on|off))\b
> > K:	\bphy_|(?:get|set)_(?:mode(?:_ext)?|media|speed|bus_width|max_link_rate)\b
> > K:	\bphy_(?:reset|configure|validate|calibrate)\b
> > K:	\bphy_notify_(?:connect|disconnect|state)\b
> > K:	(?:struct\s+)?phy(?:_ops|_attrs|_lookup|_provider)?\b
> > K:	(?:linux/phy/phy\.h|phy-props\.h|phy-provider\.h)
> 
> What about
> 
>   F:	drivers/*/*phy*
> 
> or something along these lines.

For content match, it could also be:

  K:	phy

I believe this would match everything of interest?  Perhaps there is no
need to have any of these complex regular expressions, would be my way of
thinking here.  Makes it easier to maintain, too.

Just thinking out loud, really...

	Krzysztof

