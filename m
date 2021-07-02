Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ABB13B9A4A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jul 2021 02:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234370AbhGBBAR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Jul 2021 21:00:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:48878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230369AbhGBBAQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Jul 2021 21:00:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8AF67613F4;
        Fri,  2 Jul 2021 00:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625187465;
        bh=YIHxenQ2WjimdhLt2LLEP9NzxOO6nw3lYqLd/2cAsWU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=nlRBBX+GvqBNhJGLorbzqzXuHV1XAX43YpaI0GQUuk6xLi/uReG/gfnimdiD9uZ7w
         +TtPwr5pgt7DIWrAqJ2I1WWfJIIjUwSjKB4R+rrb8nAVaUph0zMA9zL4dkpTuZERq1
         wx4LB3mFIYw4V3WY87Nyyl6YY5kTnwC4ESPaBtVpnwUUJtQLLiQp63YYLxGBa0VXAZ
         81eBu9kFD3fmDWTUXqxqd3+lDmLQY16ruiP1kg9vK3/GwxjHFStuiKpLXlmSOeBtwX
         Lg1faoXdRoyBI1t1qD82myOdQ1uvPANalUsWnAtwe3wudmiUDYZXPB7ndakTXvLFKl
         ldQe2IqChaT6w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210701232258.19146-1-alexander.helms.jy@renesas.com>
References: <202107020640.YyVoU69S-lkp@intel.com> <20210701232258.19146-1-alexander.helms.jy@renesas.com>
Subject: Re: [PATCH v2 0/2] Renesas 8T49N241 device driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     robh+dt@kernel.org, mturquette@baylibre.com,
        geert+renesas@glider.be, alexander.helms.jy@renesas.com,
        david.cater.jc@renesas.com, michal.simek@xilinx.com
To:     Alex Helms <alexander.helms.jy@renesas.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Date:   Thu, 01 Jul 2021 17:57:44 -0700
Message-ID: <162518746420.3570193.3670897082897622119@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Alex Helms (2021-07-01 16:22:56)
> A common clock framework device driver for the Renesas 8T49N241 universal
> frequency translator.

Please don't send the next revision of the patch series as a reply to
the previous series. It gets buried in my inbox and is harder to track
revisions. Thanks.
