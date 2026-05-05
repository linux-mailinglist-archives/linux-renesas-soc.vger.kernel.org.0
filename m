Return-Path: <linux-renesas-soc+bounces-32007-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHPzCiKY+WmB+AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32007-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 09:11:30 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 936624C7957
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 05 May 2026 09:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2878C3078270
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 May 2026 07:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454963D5648;
	Tue,  5 May 2026 07:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwXns3eJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB46A3D170B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 May 2026 07:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777964533; cv=none; b=luezPuOOx0C2xfpjFcpBckbRdPUSVNN8esa51Ncs5CgSxdYmcUKDWJ88gL+7TaxfCi5gqnQmJ0KGPpUs25u2uUiaUNQfUgS0oNKkekd7RZqAKghrUjYvSz5SSSwmGyhYdBDnKFwI7frX6QsE048E9C75AkfYiKvMQZuEx1koPLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777964533; c=relaxed/simple;
	bh=dIt0bhTHIvJkz5CfISQGAZDSlAsq8WtJVE5Zf446eNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DrBJP5xOpYnGCFrFwkSKjcF3yRGFHV1sNgV3mxvPqAlavAzUfZuxj/3CeFuWdg+I65vJ/ERffPkmE8Xffg0AxcxJSIzN1iv6DXmPE7hGZf6hFRySZePxOquwRP5D6hmDz2RfE1Th1dOh2RrupwpE9BSjzPodqqGOEZrJ3iVcUvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwXns3eJ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b150559bso33136385e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 May 2026 00:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777964530; x=1778569330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e8byV5wezlp6VH+DbK4xuz6Jvob5WzLxHoByLo0ebWU=;
        b=QwXns3eJVdYzv3dopEan1C7bd6e5H2mMsMjQWPp3a5sf3M5eHFFFcHCg1TZwZFeIwV
         bDb4jZ6baMukGg/OeN8n2wo3afnNe6IzKJuSgn3dQOIur4RKhTDAO7ZLhHOXhITU1iIj
         tVxoskG66xj6Uxity9fYgml2W+heggMojd4Nk0upWySp7esT0F89WTqh93Q6OCnFVYj8
         hhL7mjtae8v37VZI9Ah2WCl6krE5pBdFFvr4tWRvJS8hLiIn8bpvS6seeQ/izBi8W0DX
         7l+y/IB3u9vZXeADj+7YT5N/aT9bS8yWQd67PdBf9kPb7jImAdHDxZwLgrmcc0TqUsyG
         U3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777964530; x=1778569330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e8byV5wezlp6VH+DbK4xuz6Jvob5WzLxHoByLo0ebWU=;
        b=KvfucYzRh6cnyUQiTkJnzPkQVTXMkYmGSccUb/1W+IvQZdezCsKBHCf+BcPcHv4Ag2
         l0N2AG0tnjTX06+boE7G7mpOzj9bwsweyCe3R9IokN8DnIrRTPGBZCh0Zm+KCh6XL+ix
         xtHh1lWklYucVCrcckMBVnNyPzUJGAHZ3IRAnOnr3FoYLUd5QREjkg41B4XSy9+jqfxs
         zpTlm2JsVvnCyUI9Ik950EwgBW+IX2hdk5wTo+W4swT+Dt9TDw7PYGnX8tEPxC4RSYyd
         rfTMF09J2TiF4TOuqyEXU0Ga6QzcvC1mZwUHBSQ1uF446nm3EWwQdiko/AKpS1C1I7h2
         JqZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/zNdP22RB1S75aMKNQjvtoduhIfbkqeTBc1xitG5vNOZDjNw9VtQt990eXCM2qfSV7rxs5mIUSdMOShpr+TOAU+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg3DMwL7OMcUemhP1yrtzfCCnhEbNlDs5JQmwo/VFzHnIAPbFS
	p40q9B5zJ2A7uekpdRXthpbz9+wTscPX4xJn+a8zgFPcla0/J+fnbkwC
X-Gm-Gg: AeBDietDtIcx9zBVIm7WKbyNMlxjmiXux6gu+HLenEF8/1oZzMhLV6/BLkjhzurQOnR
	vuWhzuqJbBHi5N+7RlbGQOi/tHtjbjPuMWWwoE9YuwBWthbyd93FWc7luByVnmUq5w2eoop/jIt
	FQiLlZHIPf2TuCXaaW3V+KhPIR16IQxM+AbR6mUCEeHRWMb0qYOR3T2NYCdMhn7U/qmT1iDUYio
	mHnPyAYbESxgudsr8bnqj0MEpQQH8jACgdZIZARzSU7H23b2JocdeZ7rsEPZexyj9HraYAul0fQ
	eifMdxh+M8R5KCuxXFF7Mb+byjPJhBozQ6H5rKzZvb816vCVy/T5TBPePlgjwgKZ/2xAOy7EJL3
	0KmQM2ye2kFWWp23kPgs2Qmm5nlO9BmoclU+M+4q8JZWg6lQPJWnE4siPjdmLPo5a6FguZhh4ax
	XtwIv2xVeCZMUub5rzwSIUMbH+Vl9QwKbppQDbWDykeD8DByGbfUj7SiqC1HY=
X-Received: by 2002:a05:600c:8906:b0:48a:5574:3a5b with SMTP id 5b1f17b1804b1-48a9867a7dfmr149462385e9.27.1777964529712;
        Tue, 05 May 2026 00:02:09 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:1da3:f63c:84a5:197e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb6ffb7sm329473105e9.5.2026.05.05.00.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 00:02:09 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 0/4] Add RZ/G3L SMARC EVK support for SCIF, I2C and GPIO keys
Date: Tue,  5 May 2026 08:01:53 +0100
Message-ID: <20260505070206.7932-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 936624C7957
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32007-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.renesas.com:mid,renesas.com:email]

From: Biju Das <biju.das.jz@bp.renesas.com>

This patch series aims to add support for SCIF{1..5} device nodes to
SoC dtsi. Enable I2C{2..3} and GPIO keys on RZ/G3L SMARC EVK platform.

This patch series depend up on [1] and has functional dependency
on [2].

[1] https://lore.kernel.org/all/20260430125342.439755-1-biju.das.jz@bp.renesas.com/
[2] https://lore.kernel.org/all/20260430093422.74812-1-biju.das.jz@bp.renesas.com/

Biju Das (4):
  arm64: dts: renesas: r9a08g046: Add scif{1..5} device nodes
  arm64: dts: renesas: r9a08g046: Add i2c{0..3} device nodes
  arm64: dts: renesas: r9a08g046l48-smarc: Add gpio keys
  arm64: dts: renesas: r9a08g046l48-smarc: Enable I2C{2,3} devices

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi    | 173 +++++++++++++++++-
 .../boot/dts/renesas/r9a08g046l48-smarc.dts   |  55 +++++-
 .../boot/dts/renesas/rzg3l-smarc-som.dtsi     |  32 ++++
 3 files changed, 253 insertions(+), 7 deletions(-)

-- 
2.43.0


