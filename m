Return-Path: <linux-renesas-soc+bounces-11633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 614509F9044
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 11:31:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3F9037A1B73
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 10:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74BFD1B6541;
	Fri, 20 Dec 2024 10:31:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9231BD03F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 10:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734690662; cv=none; b=FfklaYZQS1u52xMJtQagBC/QpMyh+TQw9K4G4awrTSJZ/X31Q/c3hwIOKM+hd46wZPzidXZU0O2SUCQD+SYH4Er4djvXBkOGuWTnW7B7xgnDru8Kqi/IV8+5ReM7REykjBMfTKKL7uXDYn6Ul0vhoWuscRhlsoa2lQMVHOuE99c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734690662; c=relaxed/simple;
	bh=M8qsjQarV1S/nYctvEo/KR2nUEhgl+CQ4bQ7HxZJIpU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZE+FpIYl2uLFP3xq1U+5XrJKs8CHEMRtfWbvDNBnfTFhfB9j0XXrzuSVFgETyq2MzvWR0yaNMZiBm3I0Vj+4tNyBMzWOcIhgyfCai16ytyNo6NFfnxKhvmzfhNJP+/kFaeRa3bHJoWUklPxCtt+ZFNVP7ERKCFMM7dqTlAdH7uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:7a4e:e361:29f2:181c])
	by laurent.telenet-ops.be with cmsmtp
	id qyWq2D00N5V3mYk01yWq5i; Fri, 20 Dec 2024 11:30:52 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tOaHN-001s3j-EG;
	Fri, 20 Dec 2024 11:30:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tOaFY-000gNE-G2;
	Fri, 20 Dec 2024 11:28:52 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas driver updates for v6.14
Date: Fri, 20 Dec 2024 11:28:46 +0100
Message-Id: <cover.1734689801.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734689797.git.geert+renesas@glider.be>
References: <cover.1734689797.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v6.14-tag1

for you to fetch changes up to 12e0bd600e3c2f33f9db0e3b91f6b8d8d95b7dbe:

  soc: renesas: Add RZ/G3E (R9A09G047) config option (2024-12-13 11:09:01 +0100)

----------------------------------------------------------------
Renesas driver updates for v6.14

  - Initial support for the Renesas RZ/G3E (R9A09G047) SoC.

----------------------------------------------------------------
Biju Das (1):
      soc: renesas: Add RZ/G3E (R9A09G047) config option

 drivers/soc/renesas/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

