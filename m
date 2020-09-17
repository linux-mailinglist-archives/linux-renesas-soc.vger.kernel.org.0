Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8BDD26DE15
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Sep 2020 16:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727404AbgIQOWP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Sep 2020 10:22:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:35022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727426AbgIQOUz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 10:20:55 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600352448;
        bh=Ry5WCA8++9jbQHp/+37QTDfujb+GmQhxiFjvZR6P2Tk=;
        h=Subject:From:Date:To:From;
        b=m+wTts2zy7jnckr6mTwB2AJrieOm9ebyNbc7+GoHBtYzHA+056lOTMrD4Aq8pdgD4
         nip8lxD8wD/+ixYCiZmyb4qGSDp3G2LkBdOxsuDGrs/kj7FKikOrm49d901QnrlVTW
         WIzmBIOv3tgymeO2N4j7SbKxrfw7dnGe+YLO2rD0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <160035244834.18498.17934312683024281351.git-patchwork-housekeeping@kernel.org>
Date:   Thu, 17 Sep 2020 14:20:48 +0000
To:     linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v4] net/ravb: Add support for explicit internal clock delay configuration (2020-09-17T13:57:07)
  Superseding: [v3] net/ravb: Add support for explicit internal clock delay configuration (2020-08-19T13:43:41):
    [v3,1/7] dt-bindings: net: ethernet-controller: Add internal delay properties
    [v3,2/7] dt-bindings: net: renesas,ravb: Document internal clock delay properties
    [v3,3/7] dt-bindings: net: renesas,etheravb: Convert to json-schema
    [v3,4/7] ravb: Split delay handling in parsing and applying
    [v3,5/7] ravb: Add support for explicit internal clock delay configuration
    [v3,6/7] arm64: dts: renesas: rcar-gen3: Convert EtherAVB to explicit delay handling
    [v3,7/7] arm64: dts: renesas: rzg2: Convert EtherAVB to explicit delay handling


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
