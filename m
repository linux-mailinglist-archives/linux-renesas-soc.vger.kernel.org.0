Return-Path: <linux-renesas-soc+bounces-31346-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKzSBinA4WnixgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31346-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 07:07:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5B2416FC0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 07:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 303D430CE84D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 05:06:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB9B43612E8;
	Fri, 17 Apr 2026 05:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJRlLXKm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA81314B8F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 05:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776402392; cv=pass; b=SwiBfOys7QSE+uxEJjMbqgA7xP3ORmL6NW0Czg+OTmFtjvr/GerTXBGlojYdyxvxcgsWn1BPmyuDWeWmFPXY56tHLLvIODpXsVMhBl3z4r6hCNEnGEdXYuo1Y4I+nKdcOxw7z0BaCd8ac78hB5fFZxbeZZDYyngiUWa1KP3Mftk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776402392; c=relaxed/simple;
	bh=cGpcP7poEsGLGthFXBvfo5NNBMVcBhH+NFqPvNbFjjw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k3eKUPUwO1f/D8lIk3lrBLC06L0+2PdXBHVklHjOyTdy4F5zoJV8z1MHpNkOJcQWdA8L7vNLbPJQro8nOchPjH2EWQ3TIhvXOuSLuka/eO8vT6pMEHzljkhd/mwrXz95F9oZldgX8spgg+Gp0O0rmXxSF8TWi6gTU7ma1JPVBNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJRlLXKm; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c74f0c3fc16so87938a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Apr 2026 22:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776402391; cv=none;
        d=google.com; s=arc-20240605;
        b=GxGe9ba0+Qhy6zbRXvIZtLfaIQU7wA4ZOqvtycgMRaK4BJQrZJ7FMC19gUoA6F5p8E
         6mKPescs74L83/5B1S6/a3hOD64ARmj/ArokIcjU051aLrptAxFMgpifr4K+TKRLJY+/
         mEFHwE2lz8P1gbJ6Ae6P3GNran2WcpKhMgCLRz9cJTkN97DMBz6R9vEuV5fyVMNyIYfO
         hfojcwYr5Vg1dPUYhuDC77rUZbQUahuuaGImdEs5h/Eaj5ZXufMX9lcXpYqTajW8ScmK
         KTKCs/jrJ5V1DNcaq1jWJHikugre+HHeFYBELiQl4BWfOsz5w0XICgwiVvMUJu3NzuwU
         ueKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4l2YkIki7u4jk2tOd6Zkab62D8yPBgbCmDn20o+e7AU=;
        fh=/FUfoPbtX8lw0zt8guYNMrr395a1Jv2s8sisrOIYLQE=;
        b=PKGhmC7b4dqn0Bjjf5vH/qhBGgD6nKGGTblWYwgAOH8LFFiFGTUqZZScmjPtuCCQTl
         PrcwNMVOBmtGxkuYxJiCDyVMCclEGlw4npse6E5qSaVOxFJr6ywXwu1vHZfcPWQsE20b
         3PcDR/oNBlbOK8sciRqNXKoQlMjZW9mocODBlTSeywwMwzA2r5fNa+6Z3C2IPBSsl1Xa
         cJ5lLJmBbgxzJkMqZfQlJ1icXfONlgdxm5brsZCLsGXQQc0r2/3tNnQG2b46+JCIoaxy
         1G/s55nWTDolijUBnY92kcMOnm4YySdb4Rk3ktpDAOu7igixJBsjT07Gpxf/UK/wCJMv
         xBmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776402391; x=1777007191; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4l2YkIki7u4jk2tOd6Zkab62D8yPBgbCmDn20o+e7AU=;
        b=tJRlLXKmLfJU5pgAp72tDQed2JtBHWTxObrAjcxcor2Tpy7bgFnwgrBEilArSq2lau
         qB9xsakeplDoUiW5izs54hubxnoA7ZKs3c2wmCVd/fZ6UmUXQtMZ4AQs6qntq6JFhBNX
         O0UlpWNyE1G8VbB3kawN5AORbBoQfvSe2/EUCUFOgpmdFKEAQVx2aZOrq1Bg5fhSCTrG
         WXZD9BvydEyH6sbHzBMDZiaCaHG3VCzSGKHbE+CDLj3v6raVMWLyiRY85xriBPkUg8SB
         Qhdjn8pAOd66vULxU/S9Tx5TDPTuwyYdDRe4p+57WTCH/5yrOXqXmaE13WrYdRltQL6v
         R1Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776402391; x=1777007191;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4l2YkIki7u4jk2tOd6Zkab62D8yPBgbCmDn20o+e7AU=;
        b=QM6htHrQeonJVc6ryzTDkgpv/wScHwbRI9V4dRv5xzpfl6n0FIrBdMC2A7RmyWozKX
         k2qtzqDlomE5QUi6CYHMN4gwh58GOICtTOfaAH8KYO3W9poi4kP5gR/+co4MTnw2+zSd
         ixoofgUYXri4BncKpXkdnOVQjBXogoQPGrxHmVEw9rjA8m3hQQ8imOssrbEhjYVWrMQZ
         ZHyefIPA575fUDIEL6xx1cwumW8c139nHCyc8x2y1Xd8NajRK3nZmvQOcuAowcwwlq5N
         ZLCrFtW7KSW5J44lI9XRA74oHgpcJG6IhIDg6DQ7jiubwD4y867thB4cDCj4yz0V1EvW
         BXhg==
X-Forwarded-Encrypted: i=1; AFNElJ+6iaZi3abfibv5oD4StSk8rK6kCWbiNs7B7iT3GBTRhd7OdYPTDwvVdO6QLLOHCigORjDj/TEFXZWxlulmnk+KMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaWQPKwwpuZCBy8SrVIrKMSTxHzVN9FG3K0jdVtau5eXzun0Wx
	QJbcr3oT2Hgfx4RU+H5wa+kVpnl65f6tlpsuYiOzL8japi+1Lg/QULutSxfvi7QeGUzWISdn1wC
	x0BEUbmyWURf3hVqc7Y4+sLi0CdKmVrM=
X-Gm-Gg: AeBDietpc4O/WY8Pgke7Dx/DhStVp1f64iu1gC2t238Kjd7f0Lq7X22f+HxX4u3x5dq
	3xcYFKT95GFbMTnZs13eY2rFb8RDMyUbFka9/gWjyjZvB5G4h/IY3sgl2nWZun9GUH8zVsqXe9Q
	XVD74q99l2/P25cVRIMtFjFoOml0vVmx3s5WZwfJlgCK15bU0fc4xJRYg2WY0t0u45flWzK2/8e
	s9T0KZCv2nTD0PqhCrFW9hycAEmDZtwYk+0se7cjmkXETrgiEcmwhiEjs1be+w7nQDbo+6DvyFG
	Hscg/MLD7Cgiyf2RBVAWaOmJfQK4PNT7MXS09c1Y4QtaRNO4
X-Received: by 2002:a05:6a20:2591:b0:398:9ae9:7110 with SMTP id
 adf61e73a8af0-3a08d6f1419mr1420155637.11.1776402390758; Thu, 16 Apr 2026
 22:06:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-7-phucduc.bui@gmail.com>
 <20260414-funky-sincere-polecat-20b0bf@quoll> <CAABR9nEKGSRNp=eK=ZHf6-MNsj=6cDCy1YdbzSPrHyuc3Ux0Ow@mail.gmail.com>
 <CAMuHMdVPbcz4rF8ojEcvxp1NaM2mbQ2o+HZLwnnjNnX8uHf4HA@mail.gmail.com> <CAABR9nF131G3K3-vUdaDwHuQ7MCCLd-VO5syLApE_qsn+J49kA@mail.gmail.com>
In-Reply-To: <CAABR9nF131G3K3-vUdaDwHuQ7MCCLd-VO5syLApE_qsn+J49kA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 17 Apr 2026 12:06:19 +0700
X-Gm-Features: AQROBzDu280nT-xrC2OOG5fsst3QzaCGzF7yDjhZKFyOB_YIxODbhFQoQv65pgQ
Message-ID: <CAABR9nHhYOhMnHwrqK9oRE50jyC6kq9UFpxBdG-Tum6Ajtf3Xg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ASoC: dt-bindings: renesas,fsi: add support for
 multiple clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, kuninori.morimoto.gx@renesas.com, broonie@kernel.org, 
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31346-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,renesas.com,gmail.com,glider.be,perex.cz,suse.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8D5B2416FC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

Thanks you for your review and suggestion.

I think this approach looks very good.
>     clock-names:
>       minItems: 1
>       maxItems: 8
>       items:
>        - fck # Main FSI module clock
>         - spu # optional SPU bus/bridge clock [...]
>         - icka # optional CPG DIV6 functional clocks for FSI port A
>         - ickb # optional CPG DIV6 functional clocks for FSI port B
>          [...]

Just to confirm: using this approach with a fixed order and optional
entries as described would not be
considered "flexible" in the sense that Krzysztof objected to, right?

Best regards,
Phuc

