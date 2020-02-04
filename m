Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECB9315206C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Feb 2020 19:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbgBDS0i (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Feb 2020 13:26:38 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50442 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727394AbgBDS0i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Feb 2020 13:26:38 -0500
Received: from pendragon.ideasonboard.com (64.177-245-81.adsl-dyn.isp.belgacom.be [81.245.177.64])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 706BFA58;
        Tue,  4 Feb 2020 19:26:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1580840796;
        bh=9e6q/GR/ToUsr4j3Y7oed6BavldY3aiTXQl2f/JJNTI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RyDIIG+fspa4V5SOxST3NMsr1KQmri+0b00VntTLAMB/JjR8IagZt2WhGDbkBukpf
         gj7Ab/K6aMC7tniN6y0Gvz7OaMJjm1/jF9RfsvO2TrDuM+uBkVeR8TpJr1s0/0serb
         lwg59Ry0ikPZ0A3yIpQ0whmxZs/Dpm1BRlVNkS94=
Date:   Tue, 4 Feb 2020 20:26:21 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v1] drm: shmobile: Platform data shan't include kernel.h
Message-ID: <20200204182621.GE20396@pendragon.ideasonboard.com>
References: <20200204161916.28744-1-andriy.shevchenko@linux.intel.com>
 <CAMuHMdW8kgnw4k9-jpronxDMmeZ7NJkc4Anwmc5G247QyX80GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdW8kgnw4k9-jpronxDMmeZ7NJkc4Anwmc5G247QyX80GQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Feb 04, 2020 at 06:39:34PM +0100, Geert Uytterhoeven wrote:
> On Tue, Feb 4, 2020 at 5:20 PM Andy Shevchenko wrote:
> > Replace with appropriate types.h.
> 
> Thanks for your patch!
> 
> I have only one very short question: why?

Likewise :-) The patch itself looks fine, but the commit message is a
bit terse.

-- 
Regards,

Laurent Pinchart
