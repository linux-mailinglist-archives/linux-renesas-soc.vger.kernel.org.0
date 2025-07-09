Return-Path: <linux-renesas-soc+bounces-19464-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01182AFF2C1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 22:14:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E39613B9D5A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 20:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4255B2417D9;
	Wed,  9 Jul 2025 20:14:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254DD2367B0;
	Wed,  9 Jul 2025 20:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752092046; cv=none; b=R9gwiGSOu6GaYPNqmgUQw2Q5FcXpvOfKxSqB80ocXLnsCdzBoGlFtPyXpD1E/Qw5AZI/HCQjauyitb0+haMn8SSzfSIlJK1N6468CyVoCIsMd9/DbF9JCEttnyryC8BjhMiTqso7pqTV30D+ihlbb2RcTDeBySX1n6K0W6xA4KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752092046; c=relaxed/simple;
	bh=zhGuw2v4NM8aGJ1kGv4oWhnPGTYxc+G6ASNDZAAiMPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZsVz67OCMsPzNUALoSd2lauLQeiM2KYbd0o+crDpxYer04d+iHlZ+Wx8lYmQIJDKIEHpBfuyfBMNbaK5ncjMXcPogTSvB+fbM0+sbuS80oZnQbrpj5b7eOmir8DaYcvXCKpRVnU7OJwCxZVaACBKRwE9p1wvbRxUffCXhZIBCYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5594FC4CEEF;
	Wed,  9 Jul 2025 20:14:04 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas DT binding updates for v6.17 (take two)
Date: Wed,  9 Jul 2025 22:13:26 +0200
Message-ID: <cover.1752090400.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752090396.git.geert+renesas@glider.be>
References: <cover.1752090396.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 37c78e3a456fc754e6b9aa7d94365017a33de8f8:

  dt-bindings: soc: renesas: Document RZ/T2H Evaluation Board part number (2025-06-24 10:02:12 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.17-tag2

for you to fetch changes up to f2ce1fd2d991c53d61951b3c90eda2d3b0a023ec:

  dt-bindings: soc: renesas: Document R-Car V4M-7 Gray Hawk Single (2025-07-02 21:13:10 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v6.17 (take two)

  - Document support for the Renesas Gray Hawk Single board with R-Car
    V4M-7 (R8A779H2).

----------------------------------------------------------------
Geert Uytterhoeven (1):
      dt-bindings: soc: renesas: Document R-Car V4M-7 Gray Hawk Single

 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

