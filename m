Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 507A620DF8E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2020 23:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387888AbgF2Uhy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jun 2020 16:37:54 -0400
Received: from foss.arm.com ([217.140.110.172]:39570 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729926AbgF2TT4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jun 2020 15:19:56 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B80811474;
        Mon, 29 Jun 2020 07:33:10 -0700 (PDT)
Received: from bogus (unknown [10.37.8.30])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AB5D23F73C;
        Mon, 29 Jun 2020 07:33:08 -0700 (PDT)
Date:   Mon, 29 Jun 2020 15:33:02 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     mark.rutland@arm.com, lorenzo.pieralisi@arm.com,
        ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH/RFC v2 1/2] firmware: psci: call
 pm_set_suspend_via_firmware()
Message-ID: <20200629141025.GA25875@bogus>
References: <1592566143-4546-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1592566143-4546-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592566143-4546-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

(This patch never made it to my inbox, may be due to ALKML issues on that day)

On Fri, Jun 19, 2020 at 08:29:02PM +0900, Yoshihiro Shimoda wrote:
> Call pm_set_suspend_via_firmware() in .begin() of psci_suspend_ops
> to use pm_suspend_via_firmware() on PSCI environment.
>

I don't have issues with this change as such, but I need to understand
how and why this is used. I will comment on that separately.

--
Regards,
Sudeep
