Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5841377D7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jan 2020 21:20:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726129AbgAJUUg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 10 Jan 2020 15:20:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:43532 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbgAJUUg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Jan 2020 15:20:36 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578687636;
        bh=DXcT1mQ5i2hVLqypGvnEPaTnQmwxBoQDe5zp/nLacB8=;
        h=Subject:From:Date:To:From;
        b=uUtyl4YrklMHl/5haeSRpUT9XM2MKMNXhUpzA6U3YWwmddS56djyGtkP5HxF0EFxE
         9vtL0AhMkbZx3QEYP8NV7jNdK33nkkD1A7Zuf/UeXBLfJMjna+cpWhNFKH7+508vnO
         +RVb4cR3CQHFGkZLmXvst2BPgLxdtBIdGBpTC1jY=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <157868763616.8502.3753593792371897090.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 10 Jan 2020 20:20:36 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] dt-bindings: rcar-vin: Convert bindings to json-schema (2020-01-10T20:11:46)
  Superseding: [v1] dt-bindings: rcar-vin: Convert bindings to json-schema (2019-11-08T02:16:06):
    [1/3] dt-bindings: rcar-vin: Remove paragraph about aliases
    [2/3] dt-bindings: rcar-vin: Document compatibility string for R8A77470
    [3/3] dt-bindings: rcar-vin: Convert bindings to json-schema


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
