Return-Path: <linux-renesas-soc+bounces-3127-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC2386103C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 12:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49D25286D94
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 11:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC46642A97;
	Fri, 23 Feb 2024 11:21:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DBC63104
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2024 11:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708687279; cv=none; b=IpRG3xkeGdRY1AkXqEINi7gVneWxOAK/2wlGphn2pzWqF09duUQZUwA2r5OtFzH59UYzeKlMIy8OiUJ1nN5Ogcx6VSppCCUGFUx2xqwWoWDicc0JHc5fBjgzguIyeB3VjQ6ouWTwxZBxYe4SxmifjU2PILHEWAlGv4+h737p0Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708687279; c=relaxed/simple;
	bh=cqH99IJ94yOMfxMJkfeRjPkQlolWQU3UWvLA5hnuR34=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pKgk+V5Vrf9Kyf94pMKxPbWxAkKKVOkjCRcUygjgLs3TU6SqEhlUk8T2xOZo2lDhlG9MdiWhxSSRJ+sQeSme9ERfNfvRXhjhW0ameDCinl+kLeSmyRtb+jO1MMWSwtIGHzUbNpoIp2XyeddSMjCp3nc85uxbnSQcOxuHvHSTa8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6f61:ab26:80d6:d9d4])
	by laurent.telenet-ops.be with bizsmtp
	id qbM72B00H2itsqh01bM7HQ; Fri, 23 Feb 2024 12:21:09 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rdTbu-001P3m-Vf;
	Fri, 23 Feb 2024 12:21:07 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rdTc3-00D0P4-AX;
	Fri, 23 Feb 2024 12:21:07 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas DT binding updates for v6.9 (take two)
Date: Fri, 23 Feb 2024 12:20:58 +0100
Message-Id: <cover.1708687132.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708687130.git.geert+renesas@glider.be>
References: <cover.1708687130.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 49558e814fefdf33bf0b2d1c46c30d6a3f9634f3:

  dt-bindings: soc: renesas: Document R-Car V4M Gray Hawk Single (2024-01-31 15:06:52 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.9-tag2

for you to fetch changes up to 3a9856e830500e20e61b92f5ea6b8cc505e085be:

  dt-bindings: renesas: Document preferred compatible naming (2024-02-19 11:21:04 +0100)

----------------------------------------------------------------
Renesas DT binding updates for v6.9 (take two)

  - Restore sort order,
  - Document preferred compatible naming,

----------------------------------------------------------------
Lad Prabhakar (1):
      dt-bindings: soc: renesas: Preserve the order of SoCs based on their part numbers

Niklas Söderlund (1):
      dt-bindings: renesas: Document preferred compatible naming

 .../bindings/soc/renesas/renesas-soc.yaml          | 73 ++++++++++++++++++++++
 .../devicetree/bindings/soc/renesas/renesas.yaml   | 12 ++--
 2 files changed, 79 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml

