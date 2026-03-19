Return-Path: <linux-renesas-soc+bounces-29849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cM9LH9GIu2mflQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29849-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 06:25:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C942C62FA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 06:25:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4680306E3D4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 05:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2C139A061;
	Thu, 19 Mar 2026 05:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TxfgBSY4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886AC399356
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 05:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773897796; cv=none; b=KQ1okn+2i89AmoeZW27Lv0USOa9aD4QPphxF23U7ueXyf/4QjTJH7GL0uP6pwpOklONXNsjLRb6ifQnA8J0bT8yZ0yE6F2N7qEhjJ46hq9x3Tj3dlVPURBOCkuamCHeLN54uNLTqb3n0oKIuN+tH0fOGltGQ5a9vYViPbkwInOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773897796; c=relaxed/simple;
	bh=G2zcgXUBBwUh7cls6/BZ5JBSgiMlwaZtMegf2/dfOYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cm71OB5P+gMO4gEMX5ttn2tBgASiQv1VOxhid66eFVo+8BKQAqEXrQZqYSbdLitBgktKZTaBx+KRAoSoENFFOOPGjdemmYMiaKxb0IzW2ZQjTXtzkAA4zjNHR61Zx4Y23MKsjjUC7Si1X4m8Ot22Pc2JQ9RiEFZGbI3h6iPzD8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TxfgBSY4; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48540355459so5353625e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 22:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1773897794; x=1774502594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Kt6aIgux67oUOjoEG7PdJUevFfOkA8mbhoewpRkzHo=;
        b=TxfgBSY4qB7+6MAkP0FA5hVFvepjxiJKLAxZbSeqvegbFA3Mgig3b9WIfVDTL8fd+6
         y0O07FcC21EZcATX3lTE1wI+IUUs/rKW4KPxkK4n0vF6QWCpXr16/RLVENf8/40VISk5
         oTGAMivVXJZck1hwADWm8hN5P+40hoz709c1y+lADOyoEW6jiQmll0sv1hFBTDtYIpg3
         OG1izc314e7rTLAsE4Sxw65cPkQtqhZneDAAWOk/Tf2rq346TffRyEkGaPtsO8M6grSA
         +UVM7L7pE5m9KzN632S9dUj8VG5LCm1MWwK0Z9oeN2eSiSLP/BklZqLhKHV9LFxGV69d
         v/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773897794; x=1774502594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Kt6aIgux67oUOjoEG7PdJUevFfOkA8mbhoewpRkzHo=;
        b=EM7EGmsfNZ0HHBmZ37iQKa7IzXn8HfIZiUkfgvnHpvViFltGPJivMYe9+467rbzXCJ
         OPwekGitOxebLynUqA0O9wZhBy517UNQ5XxeghnhkpaTy0evT2xoQlUw2/hAVlOmvd5s
         9hpjD2I8ca8n85zXMX6L7EB236RosR03zGHpbisDqhVGrfxmrFh/Bvq9beK6s5wuoNcS
         gh4ddMZ0w9iQ53ah+PAIaJ99n3CcQutQmcxkzcV0BuTNYmXqKtZe/aHgfPhzF6M2sFMn
         rnTkjYPLI1VrNJIq93AOfYQOwCI/pQymBdH/rPIwBqjA9KPr/HfRQH7tfaUlDEcSSDnt
         kqqA==
X-Gm-Message-State: AOJu0YwjfdZpeJIKoOStyh9zuIPblLJfL1auq1mnt77tPWzwHwQiACo/
	jXiRRM8JAFt3QYYyix1DS9IcpoSlc3vAHrqTnb5b3dRvAXOTIIoqsFt9Rr+bGCCGhYk=
X-Gm-Gg: ATEYQzzLpXwg5qUoe/JtcGMWkHGUiOTwGqxftj4DQrS1CS4pPaQwh09xsyVZcoME0J4
	Orl4Z/PHYavYmmp3VLthi3CmNlypViksXn3CFRxUOTA9TZoZv8PeZb70FL4qwiXN/6hgYs15l5h
	T1dsh/15GbsdSuceUwPxPfPzr00Gh2fGknL4+gCyl/vklATGLlE9oPEb/a0a2lYrxyA57njg2e6
	Xuk2shA0fp0bdZoamRsemeF+I8PHo4yCVmznMWjNrEQAI1K3HX3EN0lMUSf2nDB4y6AAks/FBls
	3QGW5ZAbwTeRdWj4wLmotcuSKKmqSWwqMsBCXdEOYBFqvpM11ckqTyOQKpy7HsOQi9C5Ya3fdxu
	bKnpxYjIWGt+7fTlzGG4FK+xxPQb8vtMKW9sp9vzifAmbfjHV+0yJd3mpPmn/1uKxU3LFWOX2d0
	eyHhKvynINZYGzrGLFd5B/9BD5egeWwg==
X-Received: by 2002:a05:600c:1d0b:b0:485:30f7:6e88 with SMTP id 5b1f17b1804b1-486f4577061mr101262955e9.31.1773897793836;
        Wed, 18 Mar 2026 22:23:13 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8bd5f7csm42340265e9.0.2026.03.18.22.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 22:23:13 -0700 (PDT)
Message-ID: <9e97bf7d-57f2-4c25-95e0-84d63bc48e47@tuxon.dev>
Date: Thu, 19 Mar 2026 07:23:12 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g057: Add PCIe clocks and reset
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260312111521.115392-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260312111521.115392-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260312111521.115392-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29849-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	FREEMAIL_TO(0.00)[gmail.com,glider.be,baylibre.com,kernel.org];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:dkim,tuxon.dev:mid,renesas.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E3C942C62FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/12/26 13:15, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add clocks and reset entries for the PCIe controller.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

