Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9AE3ABA6B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jun 2021 19:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbhFQRRm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Jun 2021 13:17:42 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:51679 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232245AbhFQRRm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Jun 2021 13:17:42 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id DF437E0005;
        Thu, 17 Jun 2021 17:15:32 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [RFC 0/4] media: Introduce post_register() subdev operation
Date:   Thu, 17 Jun 2021 19:16:07 +0200
Message-Id: <20210617171611.80542-1-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Hans,
   this is the result of the discussion we had yesterday, sent out just to
have a taste of how it looks like.

I won't pretend I like the outcome: it feels a bit hackish and meant to support
this precise use case.

Compared to the proposal to resurect 'init()' it indeed has the advantage that
the subdevice driver works in both deffered and non-deferred mode, but the
notifier flags seems really custom.

Also, being the new flag part of the notifier it won't be available for i2c
subdevs.

What do you think ? Does the result match your understanding ?

Thanks
  j

Jacopo Mondi (4):
  media: v4l2-subdev: Introduce post_register() core op
  media: v4l2-async: Add notifier flags
  media: v4l2-async: Call post_register() subdev op
  media: i2c: gmsl: Defer camera intialization

 drivers/media/i2c/max9286.c          | 21 ++++++--
 drivers/media/i2c/rdacm20.c          | 81 ++++++++++++++++------------
 drivers/media/v4l2-core/v4l2-async.c | 11 ++++
 include/media/v4l2-async.h           | 10 ++++
 include/media/v4l2-subdev.h          |  3 ++
 5 files changed, 89 insertions(+), 37 deletions(-)

--
2.31.1

