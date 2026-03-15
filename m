Return-Path: <linux-renesas-soc+bounces-29419-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPSOKzQzt2lHNwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29419-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Mar 2026 23:31:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B44292DA3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Mar 2026 23:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 92BB4300B066
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Mar 2026 22:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C539FC0A;
	Sun, 15 Mar 2026 22:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FMOmRAtU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F5D25A642
	for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Mar 2026 22:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773613874; cv=none; b=EcUAR7hVz6E/RxtkSd+yNPbzleDB9CbkUv/ysLAk5ycxjuzNNdfu9yDXZ/xTk2nuPK/FgNVaAFNqk4Qd8jkovt0m5idxEXexTCcHMGQcWg5mMbb2unlZ/ixEUt8XmjQB0O/btHTCtYWPqGZCYf+vBEXz3bSfJ+4C5gbApdHtoOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773613874; c=relaxed/simple;
	bh=TTa/V1HrbAjrd940eAXx8u6MNFdgAyJE+WSjwzlIgtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FS0BI2/z2s0iy5/y7kiA5nX2LzmaIuekZFHvuU+hYEzHP6h58OuNLNm4SROy4j3ccLsRK3yM9V16kLdJkTYjzDjUlZBP9gFt3yhdmq9GQDK2byEnIbN1o764dWmlgc6gITdO1OclMKv2L5O7kGmxWnhB9HKk7fa5Y6/5oI8e4V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FMOmRAtU; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-899a5db525cso45923396d6.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Mar 2026 15:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1773613872; x=1774218672; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jI74XEUptTfc4b1LFFIY6ESeak5L3Xhh9HogrQkl/co=;
        b=FMOmRAtUHl2Up8Xl48WFj7loEe6s5xVZlvSWPCdHwyqqTKhUHPlBLQ+62hVAGHIOiQ
         /RNOXxD5NcvmQR5RGL6WZ11TW/gnRQAN8jWx+5l9pc5p8IYDD0xpe3giITzK2FTaOqvB
         UAEwKv1cBo4gebpowWZhrVGEGHYUkBDmRwVOV/SJBjga7OBXL8lWS0uagygsnpugiyJ8
         ZRoHIPrI2+1ON4ybpjn/RHf3JLIQ+RFqoK4/DTf66wXzo2uRBUpyKF7g0wIWalmiuoaD
         bpSTYLFuEQQknxUhL1SbQ1Alc8wNl9MzDhb2qDzuJRFLGNy5qkWdG67Vr2JFAHIhC9x0
         6fNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773613872; x=1774218672;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jI74XEUptTfc4b1LFFIY6ESeak5L3Xhh9HogrQkl/co=;
        b=odn86HtJpQne3kACsMR634TF/NFKK82JqyVL7kukcJdvdStIYgkrHicfRzUdDm+Fkj
         yubSNwbmadA4wTyRpexZFPalAsu2FG9q1tF1J1gox2t00M6wlyt7ANHH30eCLn0fNIGd
         u/ft5YUFVm9NWrOXYVphnntWjfYqkXPqAIx4jxru0bsWUr3aluKxFMmuXZUMT4wznq7r
         9iy0RPygMFMeW1G5L6LK6eRGyXSyhgtbDqNTRODeq7nrgXyKeCrdaUKJ1Zv8v05rRXik
         PkS+dR/Gc6ogasakr7hfaRPdIw2HYots8CWC8OFDAu+gUBk8+XFjgY/SIwyAalfnGEww
         MZUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFA/wPxrGIRZq3CUOdI8m9gZ+UV8iH0SyDqdzz4pow0h5/u6t/WghBgjk6CBj7xJ9dh/RQTPVSOlYToTtDZo1RHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsF68LkWOtdyJomXSL0ucUncyRRcslQI/WdyKVzYcWXp600911
	z95pUuXY2/w7xrCdVo8Cm7w6uHJr00s4uV/Y4nqfklZBi4M302uP5BLK0sPC2sT8f2U=
X-Gm-Gg: ATEYQzxVZzFMYzKZDlGBRJwuwuYDuGD0lat4UV7cIUEf4cY/cFwfYdghmx+wJdu/ZBX
	aHgsVHUIfVIWad1zMvHlaB3ndkXHyo7PaLOT2nH6lRQPfuxQTRis0erQvlA9hVvQMKtwxnE4PQC
	RKzOC3hENP7He7aVK92nYYJcgb0YfKC5YfCE70bMNGV/KnNdP6G91ejpwiBipANfazBU2sKeMek
	lCck+sDWUZFGFlyMKcjWm1Fy3XT7bQADXb0L6G0Fv5YQRUDuMcicT9kt07R87QT2DIJNImwA3O2
	dEKhvld4Rgno+XY7V0o/Uf2RpNgQfKxTYNCC3brQEI/KLI+yEEfFztgfT9v8Aig4sxC+8BGqv+7
	L9kdQBabIJ3C2vnv13YITZiM8ySvKmn0CK+q3FSM1rVcQ54sDZex1ngvu8e++PbL22lNFXd+/68
	eRgQnPLSC0QG/RPl01imyn5sCO4+4iUXs=
X-Received: by 2002:a05:6214:1c8c:b0:89a:1888:a1e3 with SMTP id 6a1803df08f44-89a81ebb861mr170128466d6.36.1773613871925;
        Sun, 15 Mar 2026 15:31:11 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.176])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c4d6f4308sm15205046d6.8.2026.03.15.15.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 15:31:11 -0700 (PDT)
Message-ID: <ad344788-aad0-424a-a728-72b9f5f8d0e6@tuxon.dev>
Date: Mon, 16 Mar 2026 00:31:08 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: renesas: r9a09g047-sys: Mark rzg3e_sys_init_data
 as __initconst
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260309165946.3003731-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260309165946.3003731-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260309165946.3003731-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	TAGGED_FROM(0.00)[bounces-29419-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,glider.be];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,tuxon.dev:dkim,tuxon.dev:mid]
X-Rspamd-Queue-Id: 11B44292DA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/9/26 18:59, Prabhakar wrote:
> From: Lad Prabhakar<prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Annotate rzg3e_sys_init_data with __initconst as it is only used during
> initialization.
> 
> Signed-off-by: Lad Prabhakar<prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

