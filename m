Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCDB071BF0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2019 17:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbfGWPjb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Jul 2019 11:39:31 -0400
Received: from verein.lst.de ([213.95.11.211]:42788 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725601AbfGWPja (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Jul 2019 11:39:30 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id C0CA768B02; Tue, 23 Jul 2019 17:39:29 +0200 (CEST)
Date:   Tue, 23 Jul 2019 17:39:29 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org, hch@lst.de,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] usb-storage: Add a limitation for
 blk_queue_max_hw_sectors()
Message-ID: <20190723153929.GF720@lst.de>
References: <1563793105-20597-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1563793105-20597-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
