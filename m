Return-Path: <linux-renesas-soc+bounces-32012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBsPF56a+Wm2+AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 09:22:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C3E4C7CF9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 09:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6CE95300B531
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 07:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20553DA7C2;
	Tue,  5 May 2026 07:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbeSwQmg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926A73D649B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 07:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777965349; cv=none; b=kr0YGz50WfAXWMd/XthwlMC56gm08Xru+9ardDDTiDWHAMvFWMXY3VWShP3QHKfdR20UpzA32Lq/ispWU3sBEHNzk1qxnhGNRrDpm2BDrQ/qd793HCvJF1TJjoeVWTPhIuVHAhe6bPzkgNORJlp0X4VlBxbXnTOYHPYRlPd0iSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777965349; c=relaxed/simple;
	bh=okTpXfLVCDSn/wAnHr3N4/khcDgoUDYBZmBp4zJOgg0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GiteHH6RFYxJrMSWd4AJmvDaIfKAH8sLi6m/6JgTSlmHFwXRy/1OfwKZirKO7Bk/k5bKVzjUr3QOtSuM+UI/58r+DBVvFsOuLigVhg7ZeIo7GGjOAMBwBokiukmomYHhTv2m20MNBD66+YMAlH4MmSi88WVaWV1KJhOf6+zYvAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbeSwQmg; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso35114625e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 00:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777965347; x=1778570147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zGhEOIKTkcJ1l9C7M/phiwDeHKIe8ujzIZQfumwHUsY=;
        b=LbeSwQmguxD3KU4I4YGYfEqV6O4F0Cqv2fjopUpyRjgHLflzCajqc6EAVThiBVOW+W
         ZHaFFkekCmajUem8fj1tLFQsJWaFYaKdpQ6qFV/QkThfb61Bssa2GcHSby/syhai5JLi
         hp4/Ogd5nnYorWZaXQD303L63tGY36hLWS1envJb4BHSEH/xRe3QaNiV0ZwVHYKu2u7e
         3f65MaW+1e+18V7bsLja+Jo9b8dOTArbKpq4Ec81/uurAyD4HNa1FhmGKfWKTDafMw/I
         Vj0Q/5cncQkoSELU/GfMY4nz1IJNsYtA6zKKhykbFlgjmurFid9jngL0d9FgLE2czN8x
         uoqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777965347; x=1778570147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGhEOIKTkcJ1l9C7M/phiwDeHKIe8ujzIZQfumwHUsY=;
        b=ggrvIc/OuyuxjnH3AW4nCvyqgFzDGDhSBJVJpmmN0J/0Z9GZWZIx39CXq/X/K9vMJ9
         MUR6Re8c5k9vfq6mSiCdz6b1Ra6HdbSkIfD3RqJVqDlsYYW5DzeZW8Spkn9QzP1cYM6L
         ihxuO8lab3bQ1r8IJXdYMHAWaFSRRL1NqG7CO+l99PJNqYG69WjFeScHSP0wkU8GAS07
         RfvyQafgcZk1BxUxOqZFVqUTklkoy2vF5yN9Z1O1z0bakPVS5EMcXv7DOf+h+yMtd56F
         0+qjnpmNYJanGY1RFdti/ry0gKF/6HCTujFp++BVKR1sIhXQI7zP3tzu1A63VlX381Hm
         vd6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/Kv+EdU+eo0sh89g+lG7Be5sf18q+EgyDjta8bhYp/4pCf405zx1VZvHqKXkUg7EmLsgXqo3OiTNerQgimzXXGeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtEqi84/ERgP2mLBkjEgJRDohS6mAUoIzS8fhgmlUVyAHM3bUP
	XiRnpGwCjBYqWSLhewwjNTLnNYtkzxp3QftS5DipiGZhqbPTP74ZCuOb
X-Gm-Gg: AeBDiesi3ZWy51appfKPTwyHghvghouUcTShp0kXu3z5wTJkKyh4VLDByZIrhH0S9oe
	VTzghdbmnaDUCzKVhVZ2Gl+RkmWa33pTK3Ql9+3Q9qmnN2OeLB45Ono45N7bpqX8Iys4QkNJGPF
	zzsbqxDZ5Gndsn3dlYbMtDiRT3qXRN/CckyhXKLKaUT2iRSRSg0QamYzHRdH3ZuW5ViIxtenkTD
	GEJybu7V2BGKjhUHexbkc1OSkvODRpi8bzul5waGK6iFEIeYZ7EzXchoY+bMnbISnIXmMODZfzU
	KZxhwXQDiPfpUJ52ObNl9vqP/pVKGQnKwTSbk3Qso/8gMdlZL3LplYaixOq376yRD2Ayze1PqDQ
	MJut8a0VP7Uy90Ksq+xi86FqkO3MCnIFL/V4q43ggiZW9X2Ap3J9M7fwLzx3vMfGk4jy+EJ9Flv
	9dkXqLjNPKZm3uj5BhSCP/WWNWjn2Q18kWlaSCebz1WCo9VECNqN/bdQFhhdA=
X-Received: by 2002:a05:600c:c058:b0:485:35d3:ce59 with SMTP id 5b1f17b1804b1-48a98874f6fmr132681365e9.10.1777965346710;
        Tue, 05 May 2026 00:15:46 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb694fcsm352005845e9.3.2026.05.05.00.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:15:46 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/3] clk: renesas: r9a08g046: Add {RSCI,RSPI,SSIF-2} clk/resets
Date: Tue,  5 May 2026 08:15:36 +0100
Message-ID: <20260505071544.8965-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 55C3E4C7CF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32012-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,redhat.com,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.989];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,bp.renesas.com:mid]

From: Biju Das <biju.das.jz@bp.renesas.com>

Hi All,

This patch series adds support for {RSCI,RSPI,SSIF-2} clk/resets for
RZ/G3L SoC.

This patch series is depend upon [1]
[1] https://lore.kernel.org/all/20260504144523.153906-1-biju.das.jz@bp.renesas.com/T/#t

Biju Das (3):
  clk: renesas: r9a08g046: Add clock and reset entries for the RSCI
  clk: renesas: r9a08g046: Add SSIF-2 clock and reset entries
  clk: renesas: r9a08g046: Add RSPI clock and reset support

 drivers/clk/renesas/r9a08g046-cpg.c | 141 ++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)

-- 
2.43.0


