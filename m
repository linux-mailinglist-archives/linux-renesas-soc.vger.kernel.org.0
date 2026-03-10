Return-Path: <linux-renesas-soc+bounces-29159-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HRWFwaOsGkukgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29159-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 22:32:54 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 00541258533
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 22:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0151132128F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Mar 2026 21:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0343EDACF;
	Tue, 10 Mar 2026 21:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IP7VIMYA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACFE3EBF30
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 21:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773178191; cv=none; b=S+lGhc0pF5KmDHzuSI/6ylbWLP0V8vljGmq90E/ovjLIUJwUv/rmQszupOgKi1eojbU5Ai9s3VvsA7Z0VRw0V8q0KEVQ8tIFb9usu7Lm+JRurv0ndeF8F85neHIsG2gg5AuzwdMcDHeW8OauzpxANNaU7QMiVEfO45cwC3yH8Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773178191; c=relaxed/simple;
	bh=wOWRM0fj0zIF9OgPiw3EEjqlB/nXAs3pLmqMvkzDdWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o5tC6m2OAjekUwzW+lGsPg/AgZ1t906Jgh22pwkEflRZZ7+OT/DEQ/IcPg03h+WSA6equ9r8V9KNKIFf663kMd/GISrNxkBU4uff9ONDxipwMBZ0WjLY6X1yfnWuYeFhwNsmFvJz0HYoYA/1ayBu/i8vD68eyRNqmS3O36Lnib0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IP7VIMYA; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4852f73d0a3so32081715e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Mar 2026 14:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773178186; x=1773782986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8n3BJ6hNVZFJuiNqjhI2T3Os99WW4Q8B5O2W84Ma2IY=;
        b=IP7VIMYAgmbZrhKU3QbhSECnJ9grysxAwb96kKgEeUNRbAoAz4B8csp/qI61UgYn7W
         Dv2W0fBH3IeyW6p2Nei9tLC90CKdFc1a6EOQ5g+Dh5gF8lVcubhZqRrVVhDEe/XgyJJA
         h8K9hEsh+spEsK8nFvGrZ+KZ/K3S2uAwYkpj/Lv6kmM0BGfaEEEqbsPpam+WlPL03fVM
         ZHcV2QRQEDm+WnVb39Tx0Dyud08Y/sHfMqUg9H4xRUoyHCJZUetZMZbGRCsIen4D77Or
         WPIyrqoLls24OYiGIAIjlKPXw517Az4QSIaioi5TVE1+WXqLAeUoUogHHh6fA2673NJJ
         8rLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773178186; x=1773782986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8n3BJ6hNVZFJuiNqjhI2T3Os99WW4Q8B5O2W84Ma2IY=;
        b=YyKgjpJeKIPcnsH3GYjZe1qlpOhLLA8fx91Ewycn6IQXh6Zq4UZyA0Zldni+I+1M8Z
         HL1NYUqdbE31vmSwo4D3RKUTfx45kk9hXxF3fG5petgQwHYLp0vaimgjGy0SjhG0JraF
         Olkjfl5FUN2GssQIs+jcv1/8YQvNuhe7Qza4BhUtl6tXOo3Do7IRLxmKVdmHmhfTc70F
         +VMCKnJkZde2LBmS7RfLuHhon3WbaSoeaVd/Cy7dw2km9kcoIjDktL4MVJrFEfoZoy2D
         S3MUdokLDkD+t4UXvpWKkeFNwgEkpfeT7N3jxM/AjbXOfpFr50QDjSnelEsUVBc08iVY
         ROEA==
X-Forwarded-Encrypted: i=1; AJvYcCWevb69w6xEcZV0MBwRZf1LOeznuGgfPELOs9Yv1FI8DDugFXywWQoR7944rOCSsQY/SpW/7sJLMqsYQF3dZcXgtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfyRWnn0jYPA/0McvBfz4etFCwhyv0IF1x5vNpexXOvhfZP/Mq
	pw1u1igT8nzxm7E6AFGIp1YV0sawDJ1I55fGxa3xYr3GYw1fW73uKpmI
X-Gm-Gg: ATEYQzxiWbwkaI5kFKRoQoRK2KJ8K09x5KswDpQOoYbOVDBF0O4VMZHi3Znb72iAQhJ
	Bfjentps2Q/f0WgkrZYp1FUfkYDNoCXmSTxdr2ZrwZzOaonN0YR/pmOYhva4OoCqBXxwAJ5C1y4
	V3H2zBEIoQQk4bWNZ/4WO8IvkYM1zuS889Cg4qiCATr2/EqfSHZf8OnULhzdG+WHzop+0VfdyK7
	i6nsCseRpbqg8cBFNeHuhqsPPpDM//zIwu9jUhjMz7XK84wzyexPm12B6oFJt9++j/zMaz1f14H
	kuuaPyobt6oYjl3W0KxbSSDw/MXl0KR/1/lOhEGx7eRqWDVCDXY3FstS+QFr9/pXdIvFwB9HGyB
	9S0kIJX7Wj+ZZtmoYQ+S5oZpLBrKBk+QhO1vKI3aYl1tlxedS23jdrSkzSGWHQqpDchh6rZZfCl
	ucJhslFzgXhj6RQ97T0p66MzZRaG8qvV62V3vc+zodfqQ+XJdCOG0SEq+kXJ6OlG/humOFFCk4c
	1x5duDZ1GZQ+LqIYo/jO7hB6es5cMACbdc0XA==
X-Received: by 2002:a05:600c:8710:b0:485:3f72:3230 with SMTP id 5b1f17b1804b1-4854b0d2917mr4320505e9.15.1773178186201;
        Tue, 10 Mar 2026 14:29:46 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:82df:eef6:d0c5:70a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d37fsm1247104f8f.6.2026.03.10.14.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 14:29:45 -0700 (PDT)
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
Subject: [PATCH 0/3] Add xSPI support for RZ/T2H and RZ/N2H SoCs
Date: Tue, 10 Mar 2026 21:29:24 +0000
Message-ID: <20260310212927.3372410-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 00541258533
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29159-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,sang-engineering.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Action: no action

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

Add support for the xSPI (Extended SPI) Interface on Renesas RZ/T2H and
RZ/N2H SoCs. The xSPI IP on these SoCs is closely related to that found
on the RZ/G3E SoC with some register bit differences in the configuration
registers.

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: memory: renesas,rzg3e-xspi: Add RZ/T2H and RZ/N2H support
  memory: renesas-rpc-if: Fix duplicate device name on multi-instance
    platforms
  memory: renesas-rpc-if: Add support for RZ/T2H SoC

 .../renesas,rzg3e-xspi.yaml                   | 60 +++++++++++++++----
 drivers/memory/renesas-rpc-if.c               |  3 +-
 2 files changed, 51 insertions(+), 12 deletions(-)

-- 
2.53.0


