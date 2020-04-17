Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D06111AD55B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2020 06:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbgDQEkh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Apr 2020 00:40:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:58274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725900AbgDQEkg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Apr 2020 00:40:36 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587098436;
        bh=6quxxi9cpHIP99SFUQ6DTf88/Kpeb1rytH7Og5DzJsE=;
        h=Subject:From:Date:To:From;
        b=aYB1Ln+3gP2J3ZOaebImZMP+G4GXaU+PbyJBjEVAMBLcBbJGxJJdqKbnhMdhp3wTx
         ktv7hAPn3UZVoVa5+vgDAOU9cyitUmHkg9yhsSWtXimPlaCMcttYGVqSeiJBp/nC5t
         d7QKbXJWG1/BmzxlCMhm+BY0zcJcynh2XPSR27Dk=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158709843649.6344.17622441217061358457.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 17 Apr 2020 04:40:36 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] dt-bindings: iommu: renesas,ipmmu-vmsa: convert to json-schema (2020-04-17T04:35:15)
  Superseding: [v2] dt-bindings: iommu: renesas,ipmmu-vmsa: convert to json-schema (2020-04-15T09:02:17):
    [v2] dt-bindings: iommu: renesas,ipmmu-vmsa: convert to json-schema


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
