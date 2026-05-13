Return-Path: <linux-renesas-soc+bounces-32565-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wF9HAkBmBGqXIAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32565-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 13:53:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 793DE53294B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 13:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8EAB301842A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 11:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 191453FFAD2;
	Wed, 13 May 2026 11:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LoJrB+ap"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC033A5E64
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 11:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778673201; cv=none; b=QeWXZ88JKDYDkrmUOMNouZkGHjO1N0jpAkHhZYFUtJdy23b2G2f6dZgnnDgETiEEo03L2ZXOkC38/+AwQJaJRYrfumHxdMr/SRWPOJblEHTwzHAvcGGRIn0N+rY06j3cR1DnrGcJXfJLLfvaROSzaxiL5cCc5aDuii6vzca8tRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778673201; c=relaxed/simple;
	bh=+L6F9JpS3jt/WZ1xIf3AfhOznstK33i7Irskgc7mWqg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I2P4NnJIXtS8RkoPsJQJelOlwX16saFaWVbNPZuGBR9H/S1U9TWk5Ma011mBbeKZZ1XhNB99ItMxcN3KcuAKYA+MtzBlyOM+/Q6ti4GE/lnjMoevtJWKXhEwpt/lvEkH5rPiN5y+uorgmPRfQ4DTiGoLar+sIu8xBchDoSice7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LoJrB+ap; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso58536505e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 May 2026 04:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778673197; x=1779277997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4aSs6Bhbn5vbObd7D7TaqCbznDacRKBXEFAzEqtAjo4=;
        b=LoJrB+apdTlKzy4bZ2jlSDZqjMNHe/MwBQSz1aT/5kTHzlGc4XjQpEWXQXyg1Er6r1
         5UPz4dhXOdb+UsT9TfqrCTlMU29XIsAloXOX+3bd6ncEju7KKvfWct6gAMunFZXJM/Uq
         aDzdH5Jz/3sa+/QLbbic+EHqB0S/E3sXy/XXWugblpYsrgu8XyJcOOY10Z0lAnGIZrF8
         x9R2KsgQcE6aageXmWW2qm/FgPZsNvmUx31PS/euwcsghb0QFn1mG/+URFn5lrh/TdHB
         /4UKdTqt2SJRdZKLNFyO/egGxI31qYP2sX2ekduADpES7nitVVCxBfnNcOvvDrYoJBD+
         u7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778673197; x=1779277997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4aSs6Bhbn5vbObd7D7TaqCbznDacRKBXEFAzEqtAjo4=;
        b=hwmffikjQweiLqr1pjBoiqzlBJifG/cqFIod/POKEnf79M8eCERHMQOdMMoI5dZqEF
         ZaL1H9jsb601lKrbwlF0vifGajNZep8t1qNzQMlhnBNxjIHufq5kVl6GJg08Wo/+Yj2e
         C56Wa0VWfGSs2lhjlT/GCUu00j/uNGSMvycD9My42FjUFeXDhpDTOV8Jr6bzcaLIfsC3
         JijABRc9x5i96JnFb+2zVHpYptDVypknwUqMnBdCgTb0Z9ewv1PHEpU1xPD15jVS5FHD
         4zqjTub4cD78hhhtTDwfyX2irfBmKcujx3R+HoIrmaFD3UhStCYXK69dlWRio2CbeWwh
         7rXA==
X-Gm-Message-State: AOJu0Ywljs0hQW0cRtwf5bVLE907zU5PF72xLrkN8bp7n3t5ogGxqYl+
	b5IUX0RYxLeoIM9rJ0BgzedX9BUVUVSDntZeIoftlBCADqWTaN0VdOar
X-Gm-Gg: Acq92OFdnP4N0nxPzOwgYoeuwJWvMoRqbA7suPZ1t4IwtSBjyP6Sqr9Ug1HnYf7i7Aw
	oUqxgUffdZQLMMKW0qei6BsAJp/AFsQqYWJypdpOwxCVeipmIyJB/y+xFajivsE1M9H7MGqL192
	ygXwaKm8JpHsk0G9i8el1u77UCf5rl+rh/t2bTHYh8l5QABPi9YTpBr91XfqYNCEXtjHONhalMs
	2rJ2whtaVspnwcqQeHYkFuhWTRKs7Q4b/MEpBOJNqjMfN3N7ZA8Ox0dCgrfsBQEYACFmYyn5x0K
	L598jZB+FLpAYo9tz6/REk7tYgFrV193idFL+Tvau5SuFRpvLQO7mzoVVQ0YR8Tl1t9ixNkkeV6
	TDI4/Us5AZI1jgoeZGWiFma7Z+TsEmNclLS8p7e+tppFBFdg6Wzw6frUUKQoupmtEVTF7ZDiPtl
	ifR+BeZy6zTKJwcpUZ+fPJxjfzkJvci5/ab6kwlCdpOBSdkyg/MjSqsDpwWLQkAEAh1QJLh1AB8
	O6Hdgqg/1dvArTZqA92sPtDs4gzOE2dxyi7Pw==
X-Received: by 2002:a05:600c:3b15:b0:48a:58ae:9938 with SMTP id 5b1f17b1804b1-48fc9a3da4bmr40740895e9.19.1778673196859;
        Wed, 13 May 2026 04:53:16 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3e5f:9005:e5d2:460e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6aea4sm46402603f8f.10.2026.05.13.04.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:53:16 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] pinctrl: pinctrl: renesas: rzt2h: Minor cleanups
Date: Wed, 13 May 2026 12:53:10 +0100
Message-ID: <20260513115312.1574367-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 793DE53294B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-32565-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series contains two minor cleanups for the RZ/T2H pin controller
driver.

The first patch removes a dead variable left over from development.
The second patch avoids unnecessary register writes in the PFC mode
configuration sequence when the pin is already correctly configured.

Cheers,
Prabhakar

Lad Prabhakar (2):
  pinctrl: renesas: rzt2h: Remove unused variable 'j'
  pinctrl: renesas: rzt2h: Skip PFC mode configuration if already set

 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

-- 
2.54.0


