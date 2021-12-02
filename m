Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A72746600D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Dec 2021 09:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240854AbhLBJBc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Dec 2021 04:01:32 -0500
Received: from mail.iot.bzh ([51.75.236.24]:42299 "EHLO frontal.iot.bzh"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240834AbhLBJBc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Dec 2021 04:01:32 -0500
Received: from frontal.iot.bzh (localhost [127.0.0.1])
        by frontal.iot.bzh (Proxmox) with ESMTP id CB9822E6ED;
        Thu,  2 Dec 2021 09:58:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iot.bzh; h=cc:cc
        :content-transfer-encoding:content-type:content-type:date:from
        :from:in-reply-to:message-id:mime-version:references:reply-to
        :subject:subject:to:to; s=iot.bzh; bh=XUUBbsetS3CYGn5LMBzGbE/tZR
        IShnEKj2exz1lo8yw=; b=BuksMrTI4+DHKERsGJocbG+IHfayy5QZ6HaCw9BrrG
        kX/LFsZ8VPznQRi8O9P5Ks/hcUHAfyGTpPQ2CmKrrRqnw8lW4SfHC7N0NPbFyihN
        X/jFGkymF+xc6sHjfVpIb2ZwLpAr96udZU9yv6DeG7pmI+Muk2TJSju4tWdnMUX6
        KP+4xhCFonkpY+P9hE3NptUCJVRsaJkYv5jFnxWln19rYs9RhvIdIJO/sQQVW6fo
        S+KrKq7nGH1O1PoM5s7EJ9yIVx2SQXaGZuld01ua5qNR+uA6yzeM0D3De69DxMHp
        N9dEGnMVzZI6eGos8FEMYqIJRj6AS7UrjuBeldeQvh+Q==
Message-ID: <dc4b8a39-4596-23b1-81e6-84f8f17b0f0a@iot.bzh>
Date:   Thu, 2 Dec 2021 09:57:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 0/2] Initial Renesas R-Car remoteproc support
Content-Language: en-US
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        geert+renesas@glider.be
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
References: <20211130100049.129418-1-julien.massot@iot.bzh>
 <20211201164616.GA834591@p14s>
From:   Julien Massot <julien.massot@iot.bzh>
In-Reply-To: <20211201164616.GA834591@p14s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert, Mathieu,

On 12/1/21 17:46, Mathieu Poirier wrote:
> Good morning,
> 
> On Tue, Nov 30, 2021 at 11:00:47AM +0100, Julien Massot wrote:
>> Most of the SoCs in the R-Car gen3 SoC series such as
>> H3,M3 and E3 have an 'Arm Realtime Core'.
>> This Realtime core is an Arm Cortex-R7 clocked at 800MHz.
>> This series adds initial support to load a firmware and start
>> this remote processor through the remoteproc subsystem.
>>
>> This series depends on
>> https://patchwork.kernel.org/project/linux-renesas-soc/patch/20211022122101.66998-1-julien.massot@iot.bzh/
>> to be able to set the Cortex-R7 boot address.
> 
> The above depencency is needed for this patchset to compile properly.  Since
> Geert has already applied it to his renesas-devel tree we can do two things:
> 
> 1) Make this set go through Geert's tree.
> 2) Geert publishes an immutable branch I can pull the dependency from.
> 
> I'm good either way, just let me know what you want to do.
Geert, since you already have the required patch in your tree, it could make sense
if you handle this patchset too ?
Up to your choice.

Regards,

-- 
Julien Massot [IoT.bzh]

