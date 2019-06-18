Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48FCA49E7F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 12:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729477AbfFRKqC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 06:46:02 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:52266 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729098AbfFRKqC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 06:46:02 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7594C25B786;
        Tue, 18 Jun 2019 20:46:00 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 4F9669408C4; Tue, 18 Jun 2019 12:45:58 +0200 (CEST)
Date:   Tue, 18 Jun 2019 12:45:58 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/3] ARM: dts: Minor CMT update for 32-bit ARM SoCs
Message-ID: <20190618104557.cw2wj3uffzo5r4wx@verge.net.au>
References: <156076300266.5827.16345352064689583105.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156076300266.5827.16345352064689583105.sendpatchset@octo>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 17, 2019 at 06:16:42PM +0900, Magnus Damm wrote:
> ARM: dts: Minor CMT update for 32-bit ARM SoCs
> 
> [PATCH 1/3] ARM: dts: Update CMT1 DT compat strings on r8a7740
> [PATCH 2/3] ARM: dts: Update CMT1 DT compat strings on sh73a0
> [PATCH 3/3] ARM: dts: Add CMT0 and CMT1 to r8a7792
> 
> These patches modify CMT device support on r8a7740, sh73a0 and r8a7792.
> In particular r8a7740 and sh73a0 get their DT compat strings updated
> and r8a7792 gets a fresh set of CMT devices.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
> Patch 1 and Patch 2 depend on the following DT binding change:
> [PATCH 2/8] dt-bindings: timer: renesas, cmt: Update CMT1 on sh73a0 and r8a7740

Hi Magnus,

Do these also depend on a driver update to avoid a regression?
