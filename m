Return-Path: <linux-renesas-soc+bounces-29162-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UD9jCGiNsGkukgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29162-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 22:30:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D882584D2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 22:30:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 359623026B5F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 21:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054023EE1E5;
	Tue, 10 Mar 2026 21:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZ5szW7o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401563CFF6E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 21:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773178194; cv=none; b=jufD+++lah+1BAjG7UD6KC3ygVTOXfhCF5elbwgqAnQCbNUm5cJQ6wcuTudhn1LoaXJ15l3jOlYqm34F9MZKSvnFQ8fTkTgxJzIDAhiGgIzZbrVvwFZ+s2JD8a6xruyk+D3RfnDpUWApeDq6DNMkxPlDZ9h8HNNnPoinMStJVQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773178194; c=relaxed/simple;
	bh=ogXyPVzKzbJQ53vkSS2qbngNk39fkQyG1JxarA4s1mE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hpfR9jZgtP9LAYkp0XjH++HJ7n53lhqzn1WpdY3gcTTKxZJSeObWs1dFup+18gff/nfYSPC6SlOexT85mlfGldIt28of3dCxJlS2J9//bxOFAbm7lc2BNTj7T56kbs5KJ6lCMQ3jXbsfXkzeRT2WlI5j5tccAsOE8LtDkNE5tog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZ5szW7o; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48535a0ef86so25610285e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 14:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773178188; x=1773782988; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txwgTwUpWJVP1W5FlgZT0bJMXVPZO5xS2ZVTbzY6hVg=;
        b=DZ5szW7oEauAO7ms8SG/B6UeIj8FQmP+4C47LgSZCbgnNfqtt2A8ke7pqX2hKM8Qwj
         hjXOXnNBqhAQUhHDILCQHMxgn/7uzA3ucafuT4Y6tkQ7FlKl5aYlVzY5qSb1P+XflLHy
         WljqsCgYWC4M6SUFiV/pFGv10bms7jCbbsowhHIyQS2sTWpVqbVucmOglJDCjhjk/cQk
         iGw34vLMEz4Fk5bO8b8ldq50Ro/9X3jzI8yD5tOp4fnikp1e4aPr54WnLJ8WVUca70Uw
         b37FVKUIeF/6fBIrNcRlYUZuEsr4cg9EsYYp+U+ksILtVoY6JFR7aqyHmXuyv0NKeQys
         05qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773178188; x=1773782988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=txwgTwUpWJVP1W5FlgZT0bJMXVPZO5xS2ZVTbzY6hVg=;
        b=r++5oiVwA19sqSuYJ6z215pXEK3EoGmj9x6B94TGarN11xRshX77c0uvYeqafuMNq1
         mz+56fvqgK1VdMyw2fhrehfOo+DaAv93HTNemURmUXysYyr9taaYZSsGs6C25wNO6MBv
         rkaEv8+E15Z/6d8avpmaVztMDUUSr5aySSxSOkMpAbBQftHvEqh8rCjPGAUb0MPyh62U
         0jhyvI0KucW0Dlf8Dhr7ZfH2wq/KAymvtYfxt9m6o3IO0H8oa/AmZMhheyyMjz99z2lY
         T2DwYBreikgMpBShg6hJ6Xvqyln1U6h4z+4GkbfLDfDHY3Ttkx16cV9JvA7bs/MTChp9
         bnaw==
X-Forwarded-Encrypted: i=1; AJvYcCXoZhMpYbLFD1SWb+Q8RlOIfE8rKVoJH+kr5W7D/6CNA5INkGuG0RFgJFxhz/9Og1m25Afcg+MZNzt9bKXlCHMi8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyX8IJqRuNrcKhS9mrvDYEZeZAEM1niKmpoT2LBVIF6/WX5fbMm
	+qddjEoSYD+M7Ej1ekV31KrdvFCxz0oWsTIh/fq1wo2mI2rWOqAOUUrH
X-Gm-Gg: ATEYQzyKcQYep9QvRktXaMsKxaE5I4SwMnxQ0tH9L4fWhqX7ZrkrpCQ8Log/Q6MzU7+
	V1Gq608mONt738w5+JwCgW7H2mlqP1kd5R8vaC18uBRiNnkxBr5JNAX5MWqchsTwgSFFFxws6AF
	HKEXHVFx1QpJ7KgmXgRpuDJL13GkD/OSVse+bq0RKiF9QivY+I0tKvKqUBumsJMLDfnM5WUgbM0
	u7j/vdFLqd5gKv3F0kOvhiVa5QplaPu4yfNa5o/OuZMSKbWGtmGVWWc/qIcxc86JSiAvvT/47LW
	tP+xS/lsjouAZS1BHnyJxcb2YW9+NHGCQkMiIUgZ7iFrha0LE876eM/UuxierteGuVPgdHR9CCR
	y2nnHUPVFNVf2MTT8WVs0uCEpPwp/GZztdbKiiC/03QancvyM+DoGmqIzC9Qv8wTTW9Ibbotb+n
	1HiC5MRjbGPFee1WYTXCW986rVUcSOxi2zcn7sfpY2Tlr41CR/j5xsYdUdfmKiqyZQ+ywqk67T3
	TLRxSgjWMNGIZSVRoSoMWa8Kiy0x04p9BNfoQ7PzWM2jd0A
X-Received: by 2002:a05:600c:4591:b0:480:4a90:1afe with SMTP id 5b1f17b1804b1-4854b123a76mr4529995e9.34.1773178188460;
        Tue, 10 Mar 2026 14:29:48 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:82df:eef6:d0c5:70a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d37fsm1247104f8f.6.2026.03.10.14.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 14:29:47 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] memory: renesas-rpc-if: Add support for RZ/T2H SoC
Date: Tue, 10 Mar 2026 21:29:27 +0000
Message-ID: <20260310212927.3372410-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310212927.3372410-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260310212927.3372410-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D9D882584D2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29162-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,sang-engineering.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add xSPI (Extended SPI) support for the RZ/T2H SoC. The xSPI IP on RZ/T2H
is closely related to the RZ/G3E variant with some register bit differences
in the configuration registers.

Add a new compatible string "renesas,r9a09g077-xspi" for RZ/T2H while
reusing the existing xspi_info_r9a09g047 OF data. This allows the driver
to bind correctly on RZ/T2H while the register differences can be handled
in future updates as the affected configuration registers are not currently
accessed by the driver.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/memory/renesas-rpc-if.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/memory/renesas-rpc-if.c b/drivers/memory/renesas-rpc-if.c
index 3755956ae906..028bd3b4b9e3 100644
--- a/drivers/memory/renesas-rpc-if.c
+++ b/drivers/memory/renesas-rpc-if.c
@@ -1145,6 +1145,7 @@ static const struct rpcif_info xspi_info_r9a09g047 = {
 static const struct of_device_id rpcif_of_match[] = {
 	{ .compatible = "renesas,r8a7796-rpc-if", .data = &rpcif_info_r8a7796 },
 	{ .compatible = "renesas,r9a09g047-xspi", .data = &xspi_info_r9a09g047 },
+	{ .compatible = "renesas,r9a09g077-xspi", .data = &xspi_info_r9a09g047 },
 	{ .compatible = "renesas,rcar-gen3-rpc-if", .data = &rpcif_info_gen3 },
 	{ .compatible = "renesas,rcar-gen4-rpc-if", .data = &rpcif_info_gen4 },
 	{ .compatible = "renesas,rzg2l-rpc-if", .data = &rpcif_info_rz_g2l },
-- 
2.53.0


