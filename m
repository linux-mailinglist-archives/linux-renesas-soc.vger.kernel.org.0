Return-Path: <linux-renesas-soc+bounces-29194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBEAFVFjsWnsugIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 13:42:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9193263C15
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 13:42:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EA14E305B37D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Mar 2026 12:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C83E2E7635;
	Wed, 11 Mar 2026 12:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ldxgRYEX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DEC83C0625
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 12:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773232962; cv=none; b=qAhULUOfOozG0IcKVw1zswzlQGVPYQE9VI1wOAWfrSfkvOOijf0cLEq1JzVoCSCIZHhvgeY4qTg04c0ybTWHVuALAUUXHK3/uHe1+mzqzhccIqYT/V1nc5SAXFUpp6gdR08qLj6jq7XAiNzDHAT9XX5QcSBM3s5cYWoXhUDmv9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773232962; c=relaxed/simple;
	bh=1/5ob7zls6WZxijtsiG+ycBMUAEvlqzQGZtRkP8JY+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GSI5LGVOQEc4PS6Wqu1RVY8EiXWbUM8SGYsR/eL24S/go4y9ff2sxEhlHmC/ol27wS7ajhXQh2bOY7QaYCmQ/0hKFZNQwcs6qYF7cM4wIwe7By+oDzzxdm4VjOLUZavacIpfbwUk5FPqJtcnLpnlvLy51LhnQ1b3NugH8PxZQlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ldxgRYEX; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so3857299f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Mar 2026 05:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1773232958; x=1773837758; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FQMmMYHnM2EpEp1jCYHItH13VkpPNV3kwfjNHyMDIY4=;
        b=ldxgRYEXM5/sS7xZquv7FUjYkFd/K8+Nnx4uQahsDZvgZUo1KpMv5P1b+lJoD42oQ7
         o9mhzTOJel06m0h1AzlPTBV0xY9+NWhH3NUxjD8VCAWpuLstyOu2veJTtmYITdMSaujO
         r/q5jS42QzGd/jMJaoH4OZisP0iLIWD4f+4c3inAfBx+lKjlP7ZR4DTW1afJNwZrKd/2
         5o/fQPh58BRmTtlkBrlBzgn+RdsUTAxby9+IBACZrjWoiPPuGYPFY1DEjZGsSZ8S/bax
         vy3FwNFRh23CRZ5PGrifX2rTBSG59EgWqTNga6GNhk+5YfqI2lJ7PSmEWZTETWzvleuS
         CChQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773232958; x=1773837758;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FQMmMYHnM2EpEp1jCYHItH13VkpPNV3kwfjNHyMDIY4=;
        b=i8Nta71l46prXvtS6katrpO8yI1E6ShODBeHtsDjnu2lZX27RbBA/O7OBWzz4RZsUb
         uXd7DWPCSn43oOhNM4FfT5vtgD2JgETaeQpDdEbgM8CehD+MDqRZ5puRpqyctZkhEFPg
         OCoHQAAOoyzP5tZbeSXYVExFUfyTLf2CXwl7UeuS3ROYjKrfMy1ID/9Fby+v4fKocmSl
         OiFr/D3Xl86ig/Z8XCKbFcfrk+jK4qzlk94do3dklTlqlYHoXr4mGB0c0+MzGiELVPOV
         fNtOFmTyOfMU3Zh0kPw1F1CnLcwkJvOk81zABr2hEYU7U1p3R3ZK/e7jYmz+Ipc5HFc/
         8hLA==
X-Forwarded-Encrypted: i=1; AJvYcCUrQzBUVAPk9yV+z8VOsEYYJ+m8JfVnRmqNXLbxjoSUOqWUufZpxWfl381Oh3bJte1XfgpH8GvkXsBTp+xqYBg5vQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv0SouXFya2bTAv8s9qnY4FN1pMJ2+pbZYoE9fUacK9lzByWz1
	cCDQ97JPIhxDv8Fglt4xEXH7PALGhZsSC09Lg0JVc1o0telfj6Jkr0UC5yQUm5GdFAk=
X-Gm-Gg: ATEYQzzKBCTc1TDT/deBYD3BOn7HNJpT5ha/J4Ats8a+rVBGZ6iXzYfNGbX2nlHHxBO
	JwJNAE8yQZu19z0pK20jsnMTej99QeAhzHuME0ZH+uYFIJQM2Hjyu2wErZEuZZYNKDEyKnoYzZl
	L62cwXb00SZOApbknU0QiKApfV/pUi6bSRjsDCO7xrsbVubgpNF7NRvEoYpJToIE2pc/wm4iy91
	vp+wkNh6ocWAhD18w545ZmSGtqdNQnZbh7cx3ahvy4nMo1qrPjei/5Y43NWglrJTHp0AuOEwtDm
	ByxWVaWUjR5PiCAO6HSr/BbDU4+7z8CkoAyEpJNAfEddaYH3dsSmDa+eK5CNGUJo79lUSjmOmQ9
	q7G6FOMMThju7ka40if3LWOf7Z0g54+Y6RsLbqABA7ou95jaF++XRlQb1u5b6LRhklRELke1IcV
	4vByFlIQZhqkt8CRq14piCUoaJwBHSv7w=
X-Received: by 2002:a05:6000:40c8:b0:439:f605:aff0 with SMTP id ffacd0b85a97d-439f8200ae7mr4745175f8f.18.1773232958573;
        Wed, 11 Mar 2026 05:42:38 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f821a672sm6158840f8f.31.2026.03.11.05.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 05:42:38 -0700 (PDT)
Message-ID: <d88c8bcc-2694-44cd-9197-a1ab805447ff@tuxon.dev>
Date: Wed, 11 Mar 2026 14:42:36 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/15] clk: renesas: r9a09g047: Add PCIe clocks and
 reset
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260306143423.19562-1-john.madieu.xa@bp.renesas.com>
 <20260306143423.19562-5-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260306143423.19562-5-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: A9193263C15
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-29194-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,bp.renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,glider.be:email,renesas.com:email]
X-Rspamd-Action: no action



On 3/6/26 16:34, John Madieu wrote:
> Add necessary clocks and reset entries for the PCIe controller
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>


