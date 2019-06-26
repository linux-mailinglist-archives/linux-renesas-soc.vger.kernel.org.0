Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15EDB55F1F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2019 04:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbfFZCkP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 25 Jun 2019 22:40:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:46686 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726374AbfFZCkP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 25 Jun 2019 22:40:15 -0400
Received: from localhost (li1825-44.members.linode.com [172.104.248.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3BDD021655;
        Wed, 26 Jun 2019 02:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561516814;
        bh=+yKaWX6vv7kUchMDFblXKLHw3yBv5d5dFmn9OaLhxjo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sfI2uGhtTUmMo60IoFqElpRloCEef0C7ROc1Y1yL9sdWJk6m2JBSQLPxcqJzVbpFq
         PNIKn0TjcdHhBzaW4E62xr08sX9Z2tHzzLW0ocMsUxACkSYD17GVvtIy0mmh3m7NL4
         KO7lGZ5XurQyq+AqwM3PaWVgJOJsTUGGXcWe6BTc=
Date:   Wed, 26 Jun 2019 10:34:16 +0800
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/13] usb: renesas_usbhs: refactor this driver
Message-ID: <20190626023416.GA25258@kroah.com>
References: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561441137-3090-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 25, 2019 at 02:38:44PM +0900, Yoshihiro Shimoda wrote:
> This patch series is based on Greg's usb.git / usb-next branch.
> 
> The previous code had redundant memory allocations so that
> the code readability was not good. I believe this patch series
> makes it better.

Nice cleanups, thanks for this!

greg k-h
