Return-Path: <linux-renesas-soc+bounces-28482-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDdQCcotoGm+fwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28482-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 12:26:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9614D1A5056
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 12:26:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53079300F18B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 11:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1987B36921C;
	Thu, 26 Feb 2026 11:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cm2LCEH5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F043382F3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 11:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772105153; cv=none; b=ic82JT9JlQbO5/xKGOfJgNGraGQpLwX7p0fJMoFnvbh0L1Sv5badRFVvZNNveYVjECKIOacsrysnsgOeYVVtpQ18ac5qxEYe0gdkQOGjo2qoySM2E/L+2YKJj8ohB4swQLR1yxRO+evFbfLmbVF8ilqm0g6JGxFhTn87d4HSeBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772105153; c=relaxed/simple;
	bh=X7aGML1SMAsWeqcVjsSBRTgitUAtQY7ToN2QOukGVTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qHJAop1Qcfd9hQFtmSZd+tv/9QzR3Ibv4GjDIqSAlSHtOxv5ao0wEHjTVt6uyDMP3cu+q/x8hErGIoyzW2Wlbb2nds2MJWEZHKkJp1pCwKCylri2sJunrZCiazpkVwfWy2UAP0dD+7dziCzwxQTLGxhLwHrjsD3hyV4ysA2gk0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cm2LCEH5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-483a233819aso7943895e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 03:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1772105150; x=1772709950; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/CkoirfCooP2OVGzq7jy6w3vIPwFS3mfXfxd2A0Wk0=;
        b=cm2LCEH5bDqmlGU1CFDcEAYlfPhu+07QiJwdYpWhaCkEjylib10qs4pthcQnTl5lja
         btNP9gFWUEHDH3Kqlr/qE/suHXKqs15KvhT0X5hpMsCFhSo3dIzfBk+eekuFuEk7Yhw6
         iwTq4ZVt0H8nMYS/pzbbdP/aXYkQLAPQa9Xdhu5+z2+1IoboS7miq+2ainNYtCpuxw4P
         EqPlCsAEl6P5vflaR0gMFIviAmXlGSrK4C7PtW6srUdYI66nHVDdyThZa60LXXUiVXQD
         aKxd3AI+iZMJ9BIU0wRJWgBoeplr2SN455enou1+4SYdX3yKGqNT0Y3GJw5AIw0oQMSB
         xH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772105150; x=1772709950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/CkoirfCooP2OVGzq7jy6w3vIPwFS3mfXfxd2A0Wk0=;
        b=aWhjseUDs8E1uL10k9FkvtQtEfg19LZNIG/ns8qLkfgkAOc6ozf8VZ/d292ebo3A4+
         lbek4A/TiU8IPzxf8LNcjdd+DFJfrRMqdf87IlcEcu3YJQ/zYbMJ7lt5lZq4Yl6KNu6R
         LxJVGWl+AMzpIIimbxy5V3VNC11gbSZOXjWNItA969A/BbtxcJ5kBG19BrOeidIx1ZYe
         e5l44xQrL4XoaLGXxhaJV4gKoeru9AVobM8OsCCVzIvRXawYfdsMBiL/f3xVa7hC2Twz
         vPGeaJsVuBSNPTyH9UxU6C5tJJ+HDaUo1QaM+4JyWcayuJgazYxP5qDrdVhmSmnpehEn
         JZtA==
X-Forwarded-Encrypted: i=1; AJvYcCW5cKpHtG5ZwjripaaD/a93QUWwqJ9mY5Sr046s1YEIUEc8xF8AVgCFzkuUzoAu3sFwoN/VDIOg6jIk9cA0CzbnHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxPvWtCoQa4F9HLudKG9PU33cLMtB6+AzUvoqOL9mr0CG6BbQVH
	EOH8Vf4lXGYWDnsI67R4HafJGYMjOYjhTJVdzrv4vJ8FJ1hbmYPuZQrGAgc225LGIag=
X-Gm-Gg: ATEYQzy/x5bvnAD5wZ2N0tXuGlGUDlfMYS6SeVhpSqU8ZQKAixyXpIJA5UNmwT8c2I8
	CIOgAqfjByJHWigMl2QYqVE5mZGCE2ibjlq4uwabAs7+iTsUxJ2DDryqp0Y1X72EmvH31oYD1Ty
	wr5Ag+TTMtMle3nSAE1EnLXvG14EQgdPWN+7+TWSNuB1pHvlxFX2rDqWzk4F4gU7uXzS/dgbb/f
	FtgvlF5QeZD89XKRqM8xNpJbc1IvVLjh0q74rrgyqbpdIEEOFaR8awm0v5ncavd78ILtvBVzTi/
	HLkVfMxBhQOffSVmnyakTfUGZDwM1j80u6X0mAYcqi3kdDGPIRv6+Yq4LQo0aFpSKEb7PTWDJv4
	d7vhIYPcIuVaQMtSgMUTcJP03Uhln7QywxnH+bfg+CnIPLk23uiLjMmV0ZgdzzCfAlVt17M2Y/W
	HczMEIsP6EVtoQzPx116RcH45jPXj17w==
X-Received: by 2002:a05:600c:1d1d:b0:483:498f:7963 with SMTP id 5b1f17b1804b1-483c3deae7cmr28250235e9.26.1772105150104;
        Thu, 26 Feb 2026 03:25:50 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75df9fsm148537245e9.13.2026.02.26.03.25.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 03:25:49 -0800 (PST)
Message-ID: <b8705677-67ee-450f-b0d5-8e79280c854c@tuxon.dev>
Date: Thu, 26 Feb 2026 13:25:48 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/16] PCI: rzg3s-host: Add SoC-specific configuration
 and initialization callbacks
To: John Madieu <john.madieu.xa@bp.renesas.com>,
 claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, geert+renesas@glider.be,
 krzk+dt@kernel.org
Cc: robh@kernel.org, bhelgaas@google.com, conor+dt@kernel.org,
 magnus.damm@gmail.com, biju.das.jz@bp.renesas.com,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, john.madieu@gmail.com
References: <20260219223542.6364-1-john.madieu.xa@bp.renesas.com>
 <20260219223542.6364-11-john.madieu.xa@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260219223542.6364-11-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
	TAGGED_FROM(0.00)[bounces-28482-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tuxon.dev:mid,tuxon.dev:dkim]
X-Rspamd-Queue-Id: 9614D1A5056
X-Rspamd-Action: no action

Hi, John,

On 2/20/26 00:35, John Madieu wrote:
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
> - RZ/G3S: Uses reset framework only, no callbacks needed

Some callbacks are implemented for RZ/G3S as well but they fall back to the 
reset framework. Could you please adjust this line?

> - RZ/G3E: Sets num_cfg_resets=0, provides cfg_pre_init/cfg_post_init/cfg_deinit

There is a checkpatch warning on this line as follows:

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#19:
- RZ/G3E: Sets num_cfg_resets=0, provides cfg_pre_init/cfg_post_init/cfg_deinit

Thank you,
Claudiu

