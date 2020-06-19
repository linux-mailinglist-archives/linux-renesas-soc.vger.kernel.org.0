Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13A952019E3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Jun 2020 20:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733002AbgFSSAm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Jun 2020 14:00:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:48260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726008AbgFSSAl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Jun 2020 14:00:41 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592589641;
        bh=IgpsMg4JZhlqoAt/s4AYgZAH45Lpa9DnlAFKmjBZCRs=;
        h=Subject:From:Date:To:From;
        b=ZMgMrwyasPfRpw6sDLC9Xio0dgcS5KxC9YXhfZQf4ZPCTF78x76iaGQJnlCNKu198
         w0eVoYrWaaT3qgoDFie129WNF3xOnuFjQV3QA4orUaeDJ5gd9BjsBR6mC/lY5EK2YQ
         meZoZ0cNuOLUrkfAEn0ll0DfhJ7LhtqoWyL/oB2M=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159258964099.31256.7774856362282565240.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 19 Jun 2020 18:00:40 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v1] pinctrl: sh-pfc: r8a77970: add RPC pins, groups, and functions (2020-06-19T17:54:32)
  Superseding: [v1] pinctrl: sh-pfc: r8a77970: add RPC pins, groups, and functions (2020-06-18T19:46:54):
    pinctrl: sh-pfc: r8a77970: add RPC pins, groups, and functions


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
