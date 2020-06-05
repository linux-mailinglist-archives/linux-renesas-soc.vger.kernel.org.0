Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0111EF533
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2020 12:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgFEKUl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Jun 2020 06:20:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:60676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725926AbgFEKUl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Jun 2020 06:20:41 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591352441;
        bh=bLyvXcQiOv6J/lNpjinybE8pYQ/+oLLSIpF6ahuRTgw=;
        h=Subject:From:Date:To:From;
        b=ss+QoewDKInM86gqNuF91HpaZD3xSSQos6vK2zGRy8bo48uZF31KdsbdSQ2XXRkGY
         ovuYdqgmk2MM2rV+WYQUse2gn36MhHylVSbwPmxLBO2pkcQtNC8EjI5E8bqORros8j
         IXeGsp/iKAV42n/syqZMDXUaxzQTpyDe6teZ/ICQ=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork housekeeping for: linux-renesas-soc
From:   patchwork-bot+linux-renesas-soc@kernel.org
Message-Id: <159135244119.12700.6788537067063978252.git-patchwork-housekeeping@kernel.org>
Date:   Fri, 05 Jun 2020 10:20:41 +0000
To:     linux-renesas-soc@vger.kernel.org
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Latest series: [v1] mmc: renesas_sdhi: support manual calibration (2020-06-05T10:12:21)
  Superseding: [v3] mmc: renesas_sdhi: support manual calibration (2020-06-04T12:06:33):
    [RFC,v3,1/2] mmc: tmio: add generic hook to fixup after a completed request
    [RFC,v3,2/2] mmc: renesas_sdhi: support manual calibration


-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
