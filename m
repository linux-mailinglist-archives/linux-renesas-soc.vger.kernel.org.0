Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4931FBFE3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2020 22:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731633AbgFPUUk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Jun 2020 16:20:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:33200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726856AbgFPUUk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jun 2020 16:20:40 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592338840;
        bh=VnbSghNFJwHgHjauf4cRYoD6DgbA3nhckYXVYPI6iGM=;
        h=Subject:From:Date:To:From;
        b=JO37eF01oDQK7KIjun7V0aOrLEqStPyyS3cTjQZ46ARKJmemvaYw/TJUU5IYbhLj2
         tyePylEbfTJNwX2uwxVI+GXqG6GQW1uKoDb5FVdoWjysnx6ilx2p/rEQSTpFUDAacZ
         UyoZEVnHsFdo33LyNhtdGI0omkViIWIByUv+Sxmw=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159233884010.2276.4624742300967732685.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 16 Jun 2020 20:20:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v5] Add Renesas RPC-IF support (2020-06-16T20:00:20)
  Superseding: [v3] Add Renesas RPC-IF support (2020-06-13T18:37:47):
    [v4,1/2] dt-bindings: memory: document Renesas RPC-IF bindings
    [v4,2/2] memory: add Renesas RPC-IF driver


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
