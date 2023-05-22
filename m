Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 058F170C291
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 May 2023 17:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234396AbjEVPhP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 May 2023 11:37:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234416AbjEVPhO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 May 2023 11:37:14 -0400
X-Greylist: delayed 378 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 22 May 2023 08:37:09 PDT
Received: from mail.8bytes.org (mail.8bytes.org [IPv6:2a01:238:42d9:3f00:e505:6202:4f0c:f051])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 01C40ED
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 May 2023 08:37:08 -0700 (PDT)
Received: from 8bytes.org (p200300c2773e310086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:773e:3100:86ad:4f9d:2505:dd0d])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.8bytes.org (Postfix) with ESMTPSA id 613D92434D7;
        Mon, 22 May 2023 17:30:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
        s=default; t=1684769448;
        bh=dORlFlQ9YG74GTi6oTCpk9eiByEQ4lPpF1W0CTe2AUo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ra7qzltUFox0kJbkF3OIyb5A3m+tS0n0a3NyC9725qDPnxlxkpgalmGwhI4tLFK9v
         I8ADUbn82I12/L4tm7L2GCM/apv5LBMzT277rO1Qze9xczmzRk7vodSXX//9SpXK8B
         DHWEbn9B7C95vepZxM9VqZRirwfFxizE614KR7qceDXbiqfWZWvEcIkNbwrqydPacu
         3aYS4fw3Xvc9VHbutX/kuAnPDVsdxCS+TEObu07iJ7wCnXHQHOFYZJ+fBd+p4F+GZE
         PCn5Qhmukn9SPJRHfokcJMTG60kXFSNcA9lVnKBRfZW4ejWZ+gM59sTPQsREt9ZmZx
         yCDUUuo7AF8Kg==
Date:   Mon, 22 May 2023 17:30:47 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     will@kernel.org, robin.murphy@arm.com, iommu@lists.linux.dev,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] iommu/ipmmu-vmsa: Allow PCIe devices
Message-ID: <ZGuKp2hPnkJ6hy6B@8bytes.org>
References: <20230426082511.3621484-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426082511.3621484-1-yoshihiro.shimoda.uh@renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 26, 2023 at 05:25:11PM +0900, Yoshihiro Shimoda wrote:
> To allow PCIe devices, add a new condition whether the device is
> a PCI device or not in the ipmmu_device_is_allowed().

This needs more explanation on why PCI devices are safe to be allowed.
Without this context it looks just too dangerous.

Regards,

	Joerg

