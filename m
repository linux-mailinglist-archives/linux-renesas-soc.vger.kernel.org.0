Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95C49F507
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Apr 2019 13:03:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbfD3LDS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Apr 2019 07:03:18 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60982 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726294AbfD3LDS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Apr 2019 07:03:18 -0400
Received: from pendragon.ideasonboard.com (net-37-182-44-227.cust.vodafonedsl.it [37.182.44.227])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2B6431D;
        Tue, 30 Apr 2019 13:03:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1556622196;
        bh=S2wj4AnFY5oatIjhMymkOVe+UlU9ch29SvrYJCY5LBM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ToniJYI3INwm/1L6Q3yCSrKo8atiyBsK03vqk2EXKo07vdhF3WqSRfDeYORlAuDIt
         ZL1uXuIGTOprrWekSGbUVGVkCsb8JGJWq7oxjHxidXxGjMO/rI64rEBTtyiqeI88bk
         qmJk383PCSwReL3RWfs/i+tho6d5qAktA7SzrGms=
Date:   Tue, 30 Apr 2019 14:03:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [GIT PULL FOR renesas-drivers] DU -next branch
Message-ID: <20190430110304.GB4678@pendragon.ideasonboard.com>
References: <4714815.IyZ5WZzCdP@avalon>
 <CAMuHMdUiGNbTpQ-kSYFyu5c=ktFSO+FO-K5C9UPDGOgzBfSbZA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdUiGNbTpQ-kSYFyu5c=ktFSO+FO-K5C9UPDGOgzBfSbZA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Tue, Apr 30, 2019 at 12:38:40PM +0200, Geert Uytterhoeven wrote:
> On Sun, Dec 16, 2018 at 6:11 PM Laurent Pinchart wrote:
> > The following changes since commit 272c1a9b493986a95219dce674c49877d98cf90f:
> >
> >   Merge tag 'exynos-drm-next-for-v4.21-v2' of git://git.kernel.org/pub/scm/
> > linux/kernel/git/daeinki/drm-exynos into drm-next (2018-12-14 11:27:24 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://linuxtv.org/pinchartl/media.git drm/du/next
> 
> Please rebase your branch. It conflicts due to newer versions of some commits
> having been accepted in an upstream integration tree.

Thank you for the notification. v5.1 is about to be released, I plan to
rebase then.

-- 
Regards,

Laurent Pinchart
