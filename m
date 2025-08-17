Return-Path: <linux-renesas-soc+bounces-20593-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB6DB293A4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Aug 2025 16:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D1321B20DEB
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Aug 2025 14:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023C713AD26;
	Sun, 17 Aug 2025 14:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6RP8LlU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA181624E1;
	Sun, 17 Aug 2025 14:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755442222; cv=none; b=k2q3YVO/zYKkz25LbkgWMh9faDCsX6tzTsJxdIrW6q4Heey092v9MZD8hJBK10xqlBz+5b1SjeBUfbxB3rHvaAcqmSCsMQHw2NkBvputlzf2M7IN0hWI32HTi7rzZhWaposq1sDVu0A6okcb38IaX01HyYIuV5i/XQU5Faa8qSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755442222; c=relaxed/simple;
	bh=5TTkF6oHixSGI7qMQ0SJNVote1T2AWnDW9/4iyFRL6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qGl7YXwTrREwMvp5j8ac8QkGcJwnUOmjW5E1U1WDOeBd92+6g7i6aCbXw61n9ytLsYy6wZUDg5T2JxnU+oFqumhqTBm3o72SojH0C2MMnqZ8uxj86eprk0qVJeC1rHq0Kv0Xjy13KC7lNVXqRvf0IHBsfv7/2UruX3q3ZcvcmwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6RP8LlU; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45a1b05fe23so18531635e9.1;
        Sun, 17 Aug 2025 07:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755442219; x=1756047019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KcoeDB9zQ9MJNXPgD7LIAzqfPCH8wYV+5xheA0rYfOo=;
        b=l6RP8LlUBWa6HqQtb2QZmiihKbuV0O3ioVu9Un6vO4/jLXJCVN0la7LAnBZkjMvgMM
         Ec4JAp3jzKsQF8zvKLo/9BtgNBcZhAlb/UBaox/5ScQxv7dDLqU+x6IiLPokvmqL/wZw
         nuJq95umrUTbwgrZSMtobnzQdFF7PfXvwsx/unRwRp3qF7IvYngIVFcfNN3yU79WqD1/
         YspF2vKXekBKXtF7duGvxQwpDglW5m14uu1jMLxu7O20WZXc12mpwG9tEXxb4ngr+WQZ
         SDrGkyOTAsL+5MdAAi4cl/vRzPrZtxtTCHHWa/QiOs5rSjLxFCVLeLmJD5MENMVls294
         WNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755442219; x=1756047019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KcoeDB9zQ9MJNXPgD7LIAzqfPCH8wYV+5xheA0rYfOo=;
        b=v7+vroo8OqAevjMvam3lf0r8ga52aK1GEMVQlZIuXjnv+gT5Aluj2WTtc2tx42k5OV
         q3SK9FKVDV6vd47OGUPMt6WggISVIZn99bYe9z6vVPAK5TGwFjJluomH//ly2OVr1Cg+
         4+nJIvPgDgOnTHQ6pmSdeHGM9EO7lSbZ/vP1SrR2r+l2hOy9Zyg7oApbsDZpVAT6ygfw
         cKCzH08p3D/hsEfji/U98LUXqpFfaAUPoVrCxL6I9IfZxQEhI95ZboK8SYV4KXHzbCnP
         HR4AkCnfOLU7Q+P0E32tnjFOSH6wd0FY5eZgoS9SBNtYy0SWp5Y10Y7ZzAnIqKVhlnJc
         xVmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUevseaICQFNx3CmXhj3jO/M5I+WurYDWw/bEIlAuFaGdESJCBtHOYXcfprHde6c/1r7ZdObyH7Wr7hYIjP@vger.kernel.org, AJvYcCWAQamulddZO/MtXc8+V/AmgUdRizsNut7MyZwDWO2ODkAuF7xxgSpBGQSChuiMBIpSDv8KdSQItAgvhce00VAGruA=@vger.kernel.org, AJvYcCX1Aig2QoMgdo/d58DQfxlsdts2XZkVOTsgn5e/EWE17AJU6OWwT7Jqm1QDEAcAwIwDHgPyhxVMDMPs@vger.kernel.org
X-Gm-Message-State: AOJu0YxwV+MvNrBUMMtO6F0ZLRfyOhr9PT7FRPdMPyifHD8izdO4bx6m
	wI1pcGRvhdfH06TkdILs0tPv3Qm/+OTIUQot5VXC1W+hH6nwq8FeyhoN
X-Gm-Gg: ASbGncvROwvLtfv2e7SJs8430o5UMvS3ZTXZZUesgOVovehiDKCuM0TzY804fb5Nn0E
	+pNErH1JjuxiOZ928VE34+xdNLGOEUQaDHlw8CmfSzkWu41AioWnG0XLGPK1Ym6f26Mp+8JIySF
	s7mjviAcNOgkjXis7uy2F9U+kyK1Pl+3bdKRrmGED9Gmp8z3tfNkcMx9bN0C+4ztSlWRTb7ohHO
	B/NP9QVMxC3t/+fsBhwjMz3TSQ/EdjwEW6sXdvOwoj5kGJ6modfm5N2i8b2QTJnye6mqB34uMg+
	ZS4ujZNtgZArswDGBBMkTGtVyIC+cHtTp1goiH4W1KCsiTUg8PTJYUgeU1JoqEje3MJdk9okhHe
	GLaHIB2qxnMaOLwY/GCFD87XWPmTRSoDT9KEMP1W+69A7ZAeyv5XJOYBbDrIJXvDgnugeUExALw
	==
X-Google-Smtp-Source: AGHT+IFLDFbBdUQw+GthrVEifO7fBIH9RfSFGx1QNaCem709LZONvEVLOz+XMcOMQPBeF4XNBXtbCA==
X-Received: by 2002:a05:600c:630e:b0:43c:f8fc:f697 with SMTP id 5b1f17b1804b1-45b3e827f65mr4150535e9.9.1755442219481;
        Sun, 17 Aug 2025 07:50:19 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a2231a448sm94161595e9.12.2025.08.17.07.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 07:50:18 -0700 (PDT)
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
Subject: [PATCH 0/2] Add Schmitt input for NMI function
Date: Sun, 17 Aug 2025 15:50:09 +0100
Message-ID: <20250817145016.166509-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The latest RZ/G3E pin control document (rev 1.2) recommends using Schmitt
input when PS0 pin used as NMI function. Enable Schmitt input for PS0 pin.

Also fix the gpio key's pin control node.

Biju Das (2):
  arm64: dts: renesas: r9a09g047e57-smarc: Fix gpio key's pin control
    node
  arm64: dts: renesas: r9a09g047e57-smarc: Use schmitt input for NMI
    function

 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.43.0


