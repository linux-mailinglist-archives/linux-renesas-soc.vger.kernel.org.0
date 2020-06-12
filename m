Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0562B1F7A3F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2020 17:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgFLPAm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Jun 2020 11:00:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:58844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726085AbgFLPAm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Jun 2020 11:00:42 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591974041;
        bh=GGJRJROk6oDbdIoY+gYmDMvZSQcvIYPNfN15FQDd4sE=;
        h=Subject:From:Date:To:From;
        b=EzBv09MhFxlFEsNtwZUG0ALAsAjlFXET4bYzNEMVK/mKnfNMvyt0mY+IJlDP/n+Sm
         KfY3PmEPO0wP6c4HyvGh6KhhMQIDOELy7QN9new8O9mgzJUTBARjbXYmPUSlTB5+RY
         GtyHLxgWb46I8OMVzj0OzvR2U9fUKLjs6s5kq2AU=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159197404151.14692.6822467369655232013.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 12 Jun 2020 15:00:41 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v10] MAX9286 GMSL Support (+RDACM20) (2020-06-12T14:47:12)
  Superseding: [v9] MAX9286 GMSL Support (+RDACM20) (2020-05-12T15:51:01):
    [v9,1/4] dt-bindings: media: i2c: Add bindings for Maxim Integrated MAX9286
    [v9,2/4] media: i2c: Add MAX9286 driver
    [v9,3/4] dt-bindings: media: i2c: Add bindings for IMI RDACM2x
    [v9,4/4] media: i2c: Add RDACM20 driver


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
