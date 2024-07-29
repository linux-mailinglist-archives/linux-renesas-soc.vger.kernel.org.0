Return-Path: <linux-renesas-soc+bounces-7590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7204193F3F6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 13:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFB2BB21972
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2024 11:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0BD145B07;
	Mon, 29 Jul 2024 11:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JxmE3xSC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E2D144D01
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 11:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722252243; cv=none; b=JhehNaAIBB1WsW613RHVQZ16Fcx3l31CgtkYEj/dXtimcQv1b2JNXzJfVfFkX3sYnHnAXeZ0IrolmH9PrbYTQ2VOwwaHockxzE4Zvlg6LwCnUMUI4CLmX02wOJPDq5FL/5NoNCGS5mVg1WqIercGqE6+RFMdao0scHp7877LB+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722252243; c=relaxed/simple;
	bh=9RtLwInqQHDnEw4q/oU/Ra8ai2q5WCqh4nw5UeWEqIg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To; b=HsCqfsa/3XxJP79Iz3vm1Uk02OTZijCLzFITOqWabij/2e2ZDlBF4Awq3Denr22upsj57Cl09PQAxfk1qTJo2Iow36fNNsaWe51vLQ4z3r1dR3AGpzuB7XA09qV4hsXw7PMUKH9CP1dawOF8B10zogdS9Qw2vl8Hm1ntsvkQdIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JxmE3xSC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67CF4C4AF07
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 11:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722252243;
	bh=9RtLwInqQHDnEw4q/oU/Ra8ai2q5WCqh4nw5UeWEqIg=;
	h=Subject:From:Date:To:From;
	b=JxmE3xSCCOryk+Rx6mhjy5kS5ue65fRPanNZGJnhPerxYWV7SuX9QTbReLUd3s728
	 oh6ng091fbfBUudnoRs1ECVsI1yjvvfyelQ8HlMpeAM+9cDNUugyx0kaikg52k+sEl
	 KYNY0VLaGT3OCuFT0cmjC21PpDVn5aFg3RWadi0jyiMRGHrOgOJMaB/Z5SYJL4PUN0
	 76kW1rOnOWYvhpyBAejg4/U8pMfzpuSWQqsar5VB06Uo2i79Q2j6Z9f1hhcl9KLHFi
	 sCIUoCIH9R/+A/qAMAHp7okR2/G42ie83zWwGI6BhFa7eJ8+UUOC0UUSxQKy9wihtT
	 zHyLPlxzRLC5w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5A86BC43443
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2024 11:24:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-renesas-soc
From: patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: 
 <172225224331.15294.14312975852942321836.git-patchwork-summary@kernel.org>
Date: Mon, 29 Jul 2024 11:24:03 +0000
To: linux-renesas-soc@vger.kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
geert/renesas-devel.git (next):

Series: Renesas SoC updates for v6.11 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=866584
  Lore link: https://lore.kernel.org/r/cover.1719578273.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas driver updates for v6.11
             [GIT,PULL,2/3] Renesas DT binding updates for v6.11


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



