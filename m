Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D528D177353
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2020 11:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbgCCKAg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 Mar 2020 05:00:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:52324 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728289AbgCCKAf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Mar 2020 05:00:35 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583229635;
        bh=FWlzlu/+j03AzIAXggxpOJD6a8sJ+B+6UAzQ4hb2cPk=;
        h=Subject:From:Date:To:From;
        b=A1o8mK5+v5neCdzliGcdWlE9iMjex7TxCUSxnIzeyLvg8R1rmZe6Pt7D7w5qZ3JUp
         NEc5vEGUugTtCQRXG9SPGbUDYCuN9RSUeN3K3C/nmP8vfM35u/BfG2bgt/1J58xKFq
         XiIQ38WDXsitFFLOWssMu0V7IXP4JRwOfxbtBKN8=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158322963551.30052.8001231232752315804.git-patchwork-housekeeping@kernel.org>
Date:   Tue, 03 Mar 2020 10:00:35 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] dt-bindings: clock: renesas: cpg-mssr: Convert to json-schema (2020-03-03T09:48:48)
  Superseding: [v1] dt-bindings: clock: renesas: cpg-mssr: Convert to json-schema (2020-02-24T15:26:40):
    dt-bindings: clock: renesas: cpg-mssr: Convert to json-schema


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
