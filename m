Return-Path: <linux-renesas-soc+bounces-28680-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wM/aFx5kpmnePAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28680-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 05:31:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AA31E8DAD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 05:31:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA08130470A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 04:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB07C37DE94;
	Tue,  3 Mar 2026 04:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HfnTcdVP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1095B342CB1
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 04:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772512274; cv=none; b=ozAXhEZ99NS43H0ZmEVPR3RmjSEaZ09pJJh9hqmKNrAUIKxg847YJh61WQ5yThSJoy3+FkX2WnY8FVH8FJ/Hkx/ktbsYfSMtuKAXqh8yK3USkq3mzVqBUGaa3YVifP87holbbBKTCRmMD38y6pYD/reHHzwR04URGgHj+g+p1qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772512274; c=relaxed/simple;
	bh=2Kf3LOTcLq111+z10oLFqpqx9K7MD+UA54ioA3mImpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POgS/gaeYNXgOVp+EZettkbY8JJgQ3+Y+w0AFKJ5XpPKCayCbfOorD4Plnx4BTMxHyT0jz3e1qbxR9KLtOdOEYIbeSO8HQVuDoFMX/VGA8Sn/8bSF4gSsBtLc4sljxCHLUznqFTiIKhwZ0MtPDryhy79Sg9ouYxs/XOASHALXtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HfnTcdVP; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8272a56b91cso4464290b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 20:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772512272; x=1773117072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XMHu6Y2gYxnqJzkOf4K6uEsNEzJ+7bA4f+5IkVS+SZ0=;
        b=HfnTcdVPPpVe76IRMJWMMRXzZwHTEXJmJ6Wj61JEn4J7C6FOlOf7MkCzIXHnACsAiT
         kZ8gX1yZOpmcwFCo9nGmINf7vZ1w3cOP0+Dr8jBtRzXW90eojTMuebkPC6eQ0fEkY1Zb
         +fnsjXuRe30T8C6s4ZDFPCzifTFPlwNUxyrMqqECDf+u6bW8T2DHpwhdk/3CU7RqIN04
         vb+0zwIgvDkeDU2O6N6Nmbx1pGB933ENyanuKZrdHqel9rTMU4NZtl+4Hbj6zMRUem01
         lLX1q5j3MYI6B2r3QKo3WaRsP7Ji4V4dal4d8caXuS+8XCfjOt4YgSNrGwWbBDctILRE
         kVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772512272; x=1773117072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMHu6Y2gYxnqJzkOf4K6uEsNEzJ+7bA4f+5IkVS+SZ0=;
        b=VfcpHMyndAl9bsHWpp/pFw2t7rjri+Ci0xeOP9nfCJUfjxZm7qBiTEtvW0tkvzAEUF
         jFPI7RF29G3WbU3qL94kfTyGIn7lLuB8eIV2E9GAaD5lNMVVYeMSnt39B//xV2lRTVY3
         9fEbEeU0khI2kagWU8HpuQFlmGwgItF3pzKJ82pzCAPH2glLolpPmC6VgpEJl19wVyX9
         Fms/3/LuakXTzfQpNksB5Rdr9mUtf2XNU8FR8p2P2Ym2wr30lFGyOKi4sg3OM8tcCKMc
         4W+PirAVOpM71R6Z5fBOP+YLFfC9JqzsV28rbEM2Ad+GFxKOv4KI3galUD1HJU1OU25s
         lEJA==
X-Forwarded-Encrypted: i=1; AJvYcCUPmZZ6IgFGCjCvVSC7Ih6z64OHxH8EeQH999uFG7ZEv2IEoXcxQmNGyEf5S4XuZdnbOu1MmF96mxXBdBjhRYnLAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlbrknoewIIriwohyCWYOWAZn/Vf837KV5JMTLGJz7Uycxuncf
	OgyRLp1bWYX3Q4Qz8d3jzEug7Y8n6P+HIhFR3CrZHa+V7RAzicxzqHkzZ7e/Ya5lk1o=
X-Gm-Gg: ATEYQzyBiL5Xto/56/nuq099AMXvpfCfm3T7RKqkhJX2VuHvlQYDEaR68MZ/92DCZoU
	AOEbPnr+x9aDIDnugj6fkzP1D1TNDUoEe0hE1DdfqzVH0tJ0ywz2B3JEl95ki3Im6kyXlTpPbU8
	mcr3M78jUqfDvfXPCwAVM/EdQHipt6ClHe5wR3ca3TEmI3gRT/cw7fy2CwCgjRxJqcxZzd2K2OO
	PGlI2P0YvyWh8dGiWQlZzkZT+ANobi97HhdPfDgFNtx2EcHdPwGQ3ydQqT5k1My0Av7B/BW1Ibs
	RCF1PGCuwe2xwB88tWdq/NRSGqN7ZEgsUT82zx7kHXR2zpTwQAUqEVLuxGfR3lUCcF1q6y3EpYK
	YEWiysGtpuAAOajkqKte8j6/sI4T0lk7ixD1sNPPM75ZJZy+bdq4bwNRo53ECezFvaiU/tXa2bd
	NwvKmKQobc4W518zWRmiYH0RGS
X-Received: by 2002:a05:6a00:9086:b0:81e:a228:f0cb with SMTP id d2e1a72fcca58-8274d9d9b38mr16557258b3a.36.1772512272261;
        Mon, 02 Mar 2026 20:31:12 -0800 (PST)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d5689csm18593111b3a.13.2026.03.02.20.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 20:31:11 -0800 (PST)
Date: Tue, 3 Mar 2026 10:01:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Ilia Lin <ilia.lin@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] of: Add and use of_machine_get_match() helper
Message-ID: <bmwutmbouey22o4zj2a4zdgahuzwdwwwnd3hagbe7ql2zcjckb@d7ytvwbpimsd>
References: <cover.1772468323.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1772468323.git.geert+renesas@glider.be>
X-Rspamd-Queue-Id: C0AA31E8DAD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28680-lists,linux-renesas-soc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viresh.kumar@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email]
X-Rspamd-Action: no action

On 02-03-26, 17:29, Geert Uytterhoeven wrote:
> Geert Uytterhoeven (7):
>   cpufreq: airoha: Convert to of_machine_get_match()
>   cpufreq: qcom-nvmem: Convert to of_machine_get_match()
>   cpufreq: ti-cpufreq: Convert to of_machine_get_match()

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

