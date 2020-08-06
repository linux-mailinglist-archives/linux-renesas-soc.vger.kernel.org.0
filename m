Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3482B23D8CC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Aug 2020 11:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729157AbgHFJgQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Aug 2020 05:36:16 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:58422 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729092AbgHFJdy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Aug 2020 05:33:54 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0769X2GK021291;
        Thu, 6 Aug 2020 04:33:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1596706382;
        bh=f7mwzXnKuiqtBiiMU3Rhds0nih4487m35ApkYoelkME=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=y9C1jVtdviwOl2VIQTG7KpVK2wkzNYZyH+po3gQia9Lyk2oRp7qw8eDkJi8uT2SPA
         ri40msE7VXSQVY8PqwsQZm3AnYH8/9M54rJXBgGKMBvSz02tMg1hiRHM9LIbxXOfpw
         ypvEFXsMh00AEHoI8t0yYFHU/VMTVQOh8kFQvJxM=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0769X2xb082543;
        Thu, 6 Aug 2020 04:33:02 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 6 Aug
 2020 04:33:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 6 Aug 2020 04:33:02 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0769X1bg108248;
        Thu, 6 Aug 2020 04:33:01 -0500
Subject: Re: [PATCH 0/8] kmsxx: Various fixes and improvements
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-renesas-soc@vger.kernel.org>
References: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <da7c77c0-db1f-b802-b130-6821d8da02c8@ti.com>
Date:   Thu, 6 Aug 2020 12:33:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200806021807.21863-1-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 06/08/2020 05:17, Laurent Pinchart wrote:
> Hi Tomi,
> 
> This patch series fixes a few issues in kmsxx, mainly related to support
> for additional pixel formats.

Thanks, looks good aside the two comments. And for the one for pixel formats, I think we can go with
what you have, and try to figure out a clean solution later (unless you already have an idea).

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
