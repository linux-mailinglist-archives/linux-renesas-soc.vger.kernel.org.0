Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C91EF1A873F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Apr 2020 19:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407579AbgDNRPn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Apr 2020 13:15:43 -0400
Received: from foss.arm.com ([217.140.110.172]:60356 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407532AbgDNRPl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Apr 2020 13:15:41 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D186C30E;
        Tue, 14 Apr 2020 10:15:38 -0700 (PDT)
Received: from [10.57.33.145] (unknown [10.57.33.145])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2BE93F6C4;
        Tue, 14 Apr 2020 10:15:37 -0700 (PDT)
Subject: Re: [PATCH] dt-bndings: iommu: renesas, ipmmu-vmsa: convert to
 json-schema
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        joro@8bytes.org, robh+dt@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org
References: <1586773533-8893-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <fef59497-e5ef-bfe4-e845-389fd623783b@arm.com>
Date:   Tue, 14 Apr 2020 18:15:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1586773533-8893-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2020-04-13 11:25 am, Yoshihiro Shimoda wrote:
[...]
> -Each bus master connected to an IPMMU must reference the IPMMU in its device
> -node with the following property:
> -
> -  - iommus: A reference to the IPMMU in two cells. The first cell is a phandle
> -    to the IPMMU and the second cell the number of the micro-TLB that the
> -    device is connected to.

This definition of what the phandle argument means...

[...]
> +  '#iommu-cells':
> +    const: 1
 > +

...deserves to be captured in a description here.

Robin.
