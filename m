Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4E041D1900
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2020 17:20:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730465AbgEMPUl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 May 2020 11:20:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:47318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728692AbgEMPUl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 May 2020 11:20:41 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589383241;
        bh=FMXvvaLZuZdSQ9WX85rV1fl2Q6NJ90lFXA6XCLtewS8=;
        h=Subject:From:Date:To:From;
        b=Du+sOz/YgiSgCsacPxgG98STCVZ2AKNrk5MAIL8pEo0x4AZmO4jZvOMPHTBhWtS4D
         KAy/C2Rp/MQhZNqjhg65cbTb2ZdY5lN2wPkYfPBTJdGmNujKs8ex5R5jrVj5AnK9eU
         gtoGh1OgCSfL40CYJYfOSQxMrzKxYvMKorrwzqvQ=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <158938324131.7197.8022601904627932312.git-patchwork-housekeeping@kernel.org>
Date:   Wed, 13 May 2020 15:20:41 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v3] dt-bindings: thermal: rcar-gen3-thermal: Convert bindings to json-schema (2020-05-13T15:12:01)
  Superseding: [v2] dt-bindings: thermal: rcar-gen3-thermal: Convert bindings to json-schema (2020-04-11T09:27:19):
    [v2] dt-bindings: thermal: rcar-gen3-thermal: Convert bindings to json-schema


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
