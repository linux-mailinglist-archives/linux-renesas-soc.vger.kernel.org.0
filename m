Return-Path: <linux-renesas-soc+bounces-18837-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C966DAEB7E3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 14:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37380640073
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 12:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825D62D3EDA;
	Fri, 27 Jun 2025 12:40:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661B32676D9;
	Fri, 27 Jun 2025 12:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028029; cv=none; b=m2exnnbb17nxY0X6PnXEnBRdaHi8hHHu/DZCW6C5jn3kLNxqnF8dn6GxjBTswElfecp6ThgY0PPH9dCujH7If+678WaeLKEtGqEZx1Lof/SYm4EBfa1nik4dJoLqgWODql4GMUUepS1dFYP2OHL2JUU87iZhpYwZkmn8myc9nkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028029; c=relaxed/simple;
	bh=DuPIy0xkeDh7mz5efBD0F6gDq3FOGMzDR6UPTnIJ9i0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h3iHIMgpR4piumtBMZpSMVFYjtc6QaC/a84LG5XS+bBWzGL8lvew2wZLHmfDzy/ZUAq5AvWyqEWy0zJDFfwAKdJrc8jSdX/qa4jOnW0R9RKCYGbxDqgKvunPPmLrtAThib+K51ys9RkfwFdOHCEaJ1YrqBO2tH793tBOESGbQH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC489C4CEE3;
	Fri, 27 Jun 2025 12:40:27 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/4] Renesas DT binding updates for v6.17
Date: Fri, 27 Jun 2025 14:40:18 +0200
Message-ID: <cover.1751026663.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751026657.git.geert+renesas@glider.be>
References: <cover.1751026657.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dt-bindings-for-v6.17-tag1

for you to fetch changes up to 37c78e3a456fc754e6b9aa7d94365017a33de8f8:

  dt-bindings: soc: renesas: Document RZ/T2H Evaluation Board part number (2025-06-24 10:02:12 +0200)

----------------------------------------------------------------
Renesas DT binding updates for v6.17

  - Document more board part numbers.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      dt-bindings: soc: renesas: Document RZ/V2H EVK board part number
      dt-bindings: soc: renesas: Document RZ/T2H Evaluation Board part number

 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

