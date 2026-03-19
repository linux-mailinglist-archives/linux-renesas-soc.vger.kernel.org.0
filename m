Return-Path: <linux-renesas-soc+bounces-29848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6D2JLbyHu2lvlQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 06:21:00 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BCC2C61EE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 06:21:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 638EC302C342
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2026 05:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71DF53988EE;
	Thu, 19 Mar 2026 05:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FoR3pa8B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3D3386C32
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Mar 2026 05:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773897653; cv=none; b=DeOl2qJKaOQPRws4ZrfFZSjceRbi7OEfmSf60RcJfrX5SYVpsBk20xsIU/0MNMSMiBp6QAD9069NClZIKZ0CU5P9jMyDYb5G8YzsuULwce5fp9dfZML5wDOdcD/t2PnPFTinVEtjUMU66AwFX2C3xNqgB9N7WZ1ZNxNTfnVUmTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773897653; c=relaxed/simple;
	bh=l9Ghg1lKC5KBtvHd3ReD9qqDmQaFSG1U2lkL8FMJZCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oywvr+P8HZOv5Ql1HA7JNF+M2nbc1P5Guvy8dTXqlAtWEMQbEVOqcA9fshqTpHA3h4oqwntloo/4yqfuH/0NbuRokQGucQ7vPPj+e7bxK5oIfX9YbbDsxQ9AH1dMD20jE6KqEm6hLc51alaYgPToBF1UrRvptweCceM5s6byI8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FoR3pa8B; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48541edecf9so6028045e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 22:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1773897649; x=1774502449; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6m4wPVx0RUZL7feW+5IYMoR5otTJB2gZZIBBvDsNZf4=;
        b=FoR3pa8BV5AqYg+CYAPMa1VT+Vr14Q/341j0BuxyLyo4O3i8TwMhMLOVryYH6MUVrn
         N8nI44dCiCYjP2FttSMtOGRiwV597ZGGBmngqtR/B6QyDvCyemdEEKytZInDmhD9neSo
         h9ZtN+3ZCCg3bRkkwH+EyR8Planw1PjKk8W+1iSFfxa/CzLnwG5wsQGEuIYJl4NI+QmL
         drjodO5dqbcYJ1td8shKwZlyKYA6Kj9Kvv4kiybI4mBJ7OzRz5R6g7Ri+1rykc5DNMRL
         yahpw/dkYyyeUDswo7Pw2x8TRGaEao+94RoU7EWVo0qQrjd/yCYVtf7Pk2IQaHqRZYet
         JRgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773897649; x=1774502449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6m4wPVx0RUZL7feW+5IYMoR5otTJB2gZZIBBvDsNZf4=;
        b=VCcvMOxv8CFHqHbci8asEdBigMMLmW5o4KYg5LIFAt3tqgPoacUAr0PFHEl0/nyPRc
         R6vxQV4QRgYyzG9WUj8VPIxDXn97ObnPWCyDX02fuMf4QtkgbJopvY2ProEpt1ZXTbgz
         hl/HFUs3cnJg95bDmNXFqdYKETae/aEwWSrACl+BByYztkU0QZLABy182TXm9kCCyJxx
         +pMsCTL3WF0bj3C9FSXJA+N71HIWtb3F28L/QRyyu2yKkJN89xhbCXzV8QC7mQFZgOU9
         C1d+Wf9F8YbZwUR5y2cRgt2Nun+yaCqzVK6qFNgyRH7+j1QhKeZbeDPpB2FpzenghUrG
         z2rw==
X-Gm-Message-State: AOJu0YxB6Xwmpd1r3U87ltj7flZ7ADWomwxtuZ6oyyzg7DFnC0cbDCAR
	VUNPReiDkc12h4QVuZCl85RkvUkASCU2/O1eCPVP8yARIvkI8SRSxy2Qy9rZ+BSav5Vkyojmt7M
	msNWJ
X-Gm-Gg: ATEYQzysb6xQv1oR47PbFV81K/cUqCzLnoLOTEU4aZiee96Ckd2OLOna8/BTz54faSL
	sADwZgU9oZq82Bgn5vJnDWw94cm/RwSBT40iBt+dziSYBQkdhhdFd8Dl1LZXKGiTIGJlb/7IhiK
	LAP/QuGMkgjx2Q6rCIiP53e9w42AyQNYWV/h67QB6w2NB4CpqdyEjH0H45kv2xk0sZYUXA4PrmA
	1JFHBfPonm2v6O+fGSbWyTsAD4RDrK+4SZ+0MPO/c28riLMAy0iUf5mEO9VqR0llYxuOkmL8/lK
	5Rv8P8heKeIDZYJgvkRXAGaHmEgjsB42mNXQe3YU0+CHOVS1phqLHxckxdWDZBiuAIMfV5zJkU6
	WKU2iz/ba2B5ftH0BO6/VXpXXtrB3g3YOdaXRcG5op6CeUH4RPoOASJMb/hn3A34AomNCYg31ru
	iPcjU+7v3/9tWES+S3kilLZWvIYsG91A==
X-Received: by 2002:a05:600c:c163:b0:485:304a:58cd with SMTP id 5b1f17b1804b1-486f441bbfcmr105559845e9.4.1773897648298;
        Wed, 18 Mar 2026 22:20:48 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8ba4a74sm39975085e9.12.2026.03.18.22.20.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 22:20:47 -0700 (PDT)
Message-ID: <6270d271-066e-47d4-8e2f-eda119b69fbe@tuxon.dev>
Date: Thu, 19 Mar 2026 07:20:44 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: renesas: r9a09g056: Add PCIe clocks and reset
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260312111521.115392-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260312111521.115392-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260312111521.115392-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	TAGGED_FROM(0.00)[bounces-29848-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:dkim,tuxon.dev:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 35BCC2C61EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/12/26 13:15, Prabhakar wrote:
> From: Lad Prabhakar<prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add clocks and reset entries for the PCIe controller.
> 
> Signed-off-by: Lad Prabhakar<prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

