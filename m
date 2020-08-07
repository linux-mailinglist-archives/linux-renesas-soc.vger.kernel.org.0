Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 999BE23EEF4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Aug 2020 16:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgHGOUn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Aug 2020 10:20:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:42718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725815AbgHGOUn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Aug 2020 10:20:43 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596810043;
        bh=Bsnr1LtVDxJjYXeKRpECT0Uu7KVuFCj0g6oZdgsnn7Y=;
        h=Subject:From:Date:To:From;
        b=JDIBfa+h5NXTGo/hb8A/FD+3IPi0tmsVUqQGF5byFceO1IskAKO35YAKaSSEtKOny
         L+1WU/D8rD7hO93y1XagB09hTy4e51W8tyVgDfIyA2B2JtZg8j76VAhn7BbCkEdXmQ
         ueLzv3CaibpUovBFKDmhDcQ4FMv886mbR68rxuSQ=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159681004328.14237.17596777642028379150.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 07 Aug 2020 14:20:43 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v2] dt-bindings: pinctrl: sh-pfc: Convert to json-schema (2020-08-07T14:13:45)
  Superseding: [v1] dt-bindings: pinctrl: sh-pfc: Convert to json-schema (2020-04-17T14:09:20):
    [RFC] dt-bindings: pinctrl: sh-pfc: Convert to json-schema


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
