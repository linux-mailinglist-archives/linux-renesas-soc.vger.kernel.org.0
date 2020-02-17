Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C610116111C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Feb 2020 12:29:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbgBQL3R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Feb 2020 06:29:17 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39178 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727370AbgBQL3R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Feb 2020 06:29:17 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D9D1A290C75;
        Mon, 17 Feb 2020 11:29:15 +0000 (GMT)
Date:   Mon, 17 Feb 2020 12:29:10 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Vitor Soares <Vitor.Soares@synopsys.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Subject: Re: [PATCH] i3c: master: no need to iterate master device twice
Message-ID: <20200217122910.696f4fe4@collabora.com>
In-Reply-To: <CH2PR12MB42164D05C1C4353CAC9F4B75AE160@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <20200214145853.24762-1-wsa+renesas@sang-engineering.com>
        <CAMuHMdWwXOb5vkexeop7zaqm7aUYcfMojVj+VrjuTUXJ+kaamA@mail.gmail.com>
        <CH2PR12MB42164D05C1C4353CAC9F4B75AE160@CH2PR12MB4216.namprd12.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 17 Feb 2020 10:43:49 +0000
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> ++Boris Brezillon,
> 
> Hi,
> 
> I didn't received the patch neither is in pachtwork I3C ML, it might be 
> held on the server.
> 
> @Boris Brezillon: Could you please check it?

Done.
