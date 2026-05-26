Return-Path: <linux-renesas-soc+bounces-33181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJNIDF4FFmr/gwcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 22:41:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 801BC5DC65E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 22:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B526303D2ED
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 20:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0015A3BFAD4;
	Tue, 26 May 2026 20:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/3VzBoT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E95C3C09E9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2026 20:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779828057; cv=none; b=La6rx/7kOT5MESaFiUeYd2OxxlLi9csGeuV3wM7CoSFErFjFcMcXvTkhlI3yMlrXAlWE3jnhYbRIzq7tBLbxDdh3HxwXknBObwE6SMrRoUgogvcN6PVfNIEGngUHmxyzHpvGWAmMPicDcEhvngEu0LAuZjhfgJ+uRrS99fw6ZYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779828057; c=relaxed/simple;
	bh=iJY2O1CoCbTDvaBXdAn0Owq3QlMoeXW8nHMcKsXdUKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gksiR3M3CJbf0HdFOeDjCnHxZGtJ31TN00q7T8ch2b/JwV88DMPuKBTZi2DpU+D8C7a9SpN7AW2p+eoCHatwCP8Svh7px4crn87qpb3AdLNnGNqtKawBvQr92Y7f6n3+EhShtvJyw/mdsFO7ddpJIL0X3Tk03a3ieQlax8LXeQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/3VzBoT; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-44e1860558fso7037171f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2026 13:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779828052; x=1780432852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lZcOBu36HEggoBtgRODABfJuXBioxKKdmGZjAU4vWsk=;
        b=C/3VzBoT1KCC4A4jFzc+b6qz8ICRWqpgvJBWHw35V1/PJ2VyvrucmqM6ip8xJ0wvNI
         F5zfOARJOE1Bg7bteDRt7/WbtTnSHX/5cHC+bbltMlDPfW4x//COrIGQBXfi2n1ESBEg
         Efy83K/QXFBc7N0oe7zZtPZKIb1R5fSypXXsocrHC9XodyLrp/B2C3un75q5BptV3kHt
         5Ahf0M4TiLBZHKQnYuh/7C/C5uCIIqeWzXCDk1U2MOPnrV1WyqvdjsXpbEkLabZcBoup
         jq/J4KAEDEwBQgSxqZDBZVpuO46iT6lNUndJazKi5ZwHCq5Hpi+myhWIaRPWH+gXqq3z
         Sj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779828052; x=1780432852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lZcOBu36HEggoBtgRODABfJuXBioxKKdmGZjAU4vWsk=;
        b=TTlcbjXUVsGMh0AI5Y0iW+OcyNnwziogcQLYf8k46uy/7r5HM3j4MpKZFEwGjIW7sC
         n598xXY1dHsDrDxpW92RPJJDkt2zxCoqPVCQcQDGA86rpBXQGuQwplqrAsL4AMH4UmwG
         ZH4mJ5izrjLku3L1ynhtqqTs5IQ1uXpRmUB6Gx0wMeGzCcKMpXNJaeJs8j00m8bxeoEK
         vn9MmTug8YlvhYWjTwT2diffmOW9zURGZ//wUtsypXhjUYoz59ugiSabd3sKVCT7vgp4
         /fRMW7gbTEPjs6Gpyiy0y6xFnaeDEGs9q+6kUktD3ljb1/JDwu51sUleoZAHl6LvdGGk
         rVZQ==
X-Gm-Message-State: AOJu0YzKQOwBbQZYP3JugMJVs5L0bh/Gw3NnSbk1KGC9vDN4H0Doo85P
	aFxRtKwfXNx3IohLNJM/3N1rl0Jgba21io9VbLoXZ7MK6tM8ytJwlx4M
X-Gm-Gg: Acq92OFImFk2t+++1zTRMto654Cj5CvmGEAoY4FEYg3Dzhoeq0dPxwiMHcA6LVoZJrc
	wgb9n7EIeQsXz0g5kKkjMgaxuh2jWevn0bWP53YjNJs1oZQ71KO7iNHEtWMZ+C7IECNLcS83QnX
	Ou0JIO1bcca7FOA3GCiHpXZwUBG2KFBLu33SHOetP9svYLBzC5kjjTchVp3134ul6wPc0XeBK2I
	8kwffcmIdwJjQ8eGKgdWf6hnWnDylqWBCl8C42GFUE+Je/zDoZsZ2mO0uhp7UH4kyNhMGK4e6cw
	DxQaZMPBkwt/2x0fz3wmoI1UmxDRM7CwRj0kzk2eXQ0fyLy/nKqrANmfSMPUTVUKjdfXVzAwQPk
	Y0ZegX5tdK6UoWpaD85viuSrp3mEikyikqPZEEAiiuBpzC1v1ghhpxVZDf6fMBeWRxd4aGGglKa
	Nzy5zf0tgTPptQU7GjJv4TtxT2r3/YBNxvFnohg5YtxdksHu9WzTML6ViAcNY5wc1c0u/4zozvQ
	Ucq8qM8O+Gpvkdk7ptqbTD2WzVxJuadUSw1XQ==
X-Received: by 2002:a05:600c:a012:b0:490:5191:6e26 with SMTP id 5b1f17b1804b1-490519170bamr285343105e9.18.1779828051774;
        Tue, 26 May 2026 13:40:51 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6e49:e380:c3e5:25e9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45edb557545sm904864f8f.12.2026.05.26.13.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 13:40:51 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] Add xSPI support for RZT2H, RZN2H SoCs
Date: Tue, 26 May 2026 21:40:42 +0100
Message-ID: <20260526204045.3481604-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33181-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 801BC5DC65E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds support for the xSPI controller on the RZT2H
and RZN2H SoCs and enables it on the RZT2H-N2H-EVK board.

Cheers,
Prabhakar

Lad Prabhakar (3):
  arm64: dts: renesas: r9a09g077: Add xSPI nodes
  arm64: dts: renesas: r9a09g087: Add xSPI nodes
  arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI nodes

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    |  38 +++++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    |  38 +++++
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 139 ++++++++++++++++++
 3 files changed, 215 insertions(+)

-- 
2.54.0


