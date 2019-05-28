Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5472CC6E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2019 18:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbfE1Qqp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 May 2019 12:46:45 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:46712 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbfE1Qqp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 May 2019 12:46:45 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id D23D680437;
        Tue, 28 May 2019 18:46:42 +0200 (CEST)
Date:   Tue, 28 May 2019 18:46:41 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH v3 00/10] R-Car DU: LVDS dual-link mode support
Message-ID: <20190528164641.GC9610@ravnborg.org>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
        a=fUZH0H9BHeJfuQvbNTQA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent.

Nice series with small and well described patches.

> On Tue, May 28, 2019 at 05:12:24PM +0300, Laurent Pinchart wrote:
>> Hello everybody,
>> 
>> This patch series implements support for LVDS dual-link mode in the
>> R-Car DU and R-Car LVDS encoder drivers, and well as in the thc63lvd1024
>> LVDS decoder driver.

Patches looks good.
With my few comments addressed:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

(Do not feel too confident in all the stuff, r-b seems to give me too
much credit for spending less than half an hour reading the patches).

	Sam
